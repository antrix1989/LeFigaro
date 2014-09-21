//
//  ANApiClient.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import <AFNetworking.h>
#import "ANApiClient.h"
#import "ANCategory.h"
#import "ANSubCategory.h"
#import "ANArticle.h"

NSString *const kBaseUrlString = @"http://figaro.service.yagasp.com";
NSString *const ANLeFigaroErrorDomain = @"com.lefigaro.app";
const int ANParseError = 1;

@interface ANApiClient ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) dispatch_queue_t syncDispatchQueue;

@end

@implementation ANApiClient

objection_register_singleton(ANApiClient)

#pragma mark - PUblic

- (void)cancelAllOperations
{
    [self.manager.operationQueue cancelAllOperations];
}

- (void)getAllCategories:(ANArrayResultBlock)block
{
    if (!block) {
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"/article/categories"];
    
    [self.manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        
        NSMutableArray *categories = [NSMutableArray new];
        
        for (NSDictionary *categoryInfo in responseObject) {
            ANCategory *category = [[JSObjection defaultInjector] getObject:ANCategory.class];
            [category readFromDictionary:categoryInfo];
            
            [categories addObject:category];
        }
        
        block(categories, nil);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
        
        if (block) {
            block(nil, error);
        }
    }];
}

- (void)getAllArticlesForSubCategory:(ANSubCategory *)subCategory withBlock:(ANArrayResultBlock)block
{
    if (!block) {
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"/article/header/%@", subCategory.remoteID];
    
    [self.manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        
        NSMutableArray *articles = [NSMutableArray new];
        
        if (responseObject.count != 2) {
            NSError *error = [NSError errorWithDomain:ANLeFigaroErrorDomain code:ANParseError userInfo:nil];
            block(nil, error);
            
            return;
        }
        
        NSArray *articlesInfo = responseObject[1];
        
        for (NSDictionary *articleInfo in articlesInfo) {
            ANArticle *article = [[JSObjection defaultInjector] getObject:ANArticle.class];
            [article readFromDictionary:articleInfo];
            
            [articles addObject:article];
        }
        
        block(articles, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
        
        if (block) {
            block(nil, error);
        }
    }];
}

- (void)getArticleWithID:(NSString *)articleID withBlock:(ANObjectResultBlock)block
{
    if (!block) {
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"/article/%@", articleID];
    
    [self.manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        
        ANArticle *article = [[JSObjection defaultInjector] getObject:ANArticle.class];
        [article readFromDictionary:responseObject];
        
        block(article, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
        
        if (block) {
            block(false, error);
        }
    }];
}

#pragma mark - Private

- (AFHTTPRequestOperationManager *)manager
{
    dispatch_sync(self.syncDispatchQueue, ^{
        if (!_manager) {
            _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrlString]];
            [_manager.operationQueue setMaxConcurrentOperationCount:1];
        }
    });
    
    return _manager;
}

- (dispatch_queue_t)syncDispatchQueue
{
    if (!_syncDispatchQueue) {
        _syncDispatchQueue = dispatch_queue_create("com.lfhttpclient.syncDispatchQueue", NULL);
    }
    
    return _syncDispatchQueue;
}

@end
