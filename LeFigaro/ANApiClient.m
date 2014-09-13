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

//@interface ANApiClient ()
//
//@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
//
//@end

@implementation ANApiClient

#pragma mark - PUblic

+ (void)getAllCategories:(ANArrayResultBlock)block
{
    if (!block) {
        return;
    }
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrlString]];
    [manager.operationQueue setMaxConcurrentOperationCount:1];
    
    NSDictionary *parameters = nil;
    NSString *urlString = [NSString stringWithFormat:@"/article/categories"];
    
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        
        NSMutableArray *categories = [NSMutableArray new];
        
        for (NSDictionary *categoryInfo in responseObject) {
            ANCategory *category = [ANCategory new];
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

+ (void)getAllArticlesForSubCategory:(ANSubCategory *)subCategory withBlock:(ANArrayResultBlock)block
{
    if (!block) {
        return;
    }
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrlString]];
    [manager.operationQueue setMaxConcurrentOperationCount:1];
    
    NSDictionary *parameters = nil;
    NSString *urlString = [NSString stringWithFormat:@"/article/header/%@", subCategory.remoteID];
    
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        
        NSMutableArray *articles = [NSMutableArray new];
        
        if (responseObject.count != 2) {
            NSError *error = [NSError errorWithDomain:ANLeFigaroErrorDomain code:ANParseError userInfo:nil];
            block(nil, error);
            
            return;
        }
        
        NSArray *articlesInfo = responseObject[1];
        
        for (NSDictionary *articleInfo in articlesInfo) {
            ANArticle *article = [ANArticle new];
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

@end
