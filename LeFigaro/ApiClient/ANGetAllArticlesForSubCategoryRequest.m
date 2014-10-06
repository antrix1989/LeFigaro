//
//  ANGetAllArticlesForSubCategoryRequest.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 10/6/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANGetAllArticlesForSubCategoryRequest.h"
#import "ANApiRequest_Private.h"
#import "ANSubCategory.h"
#import "ANArticle.h"

@implementation ANGetAllArticlesForSubCategoryRequest

#pragma mark - Public

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
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"ANArticle" inManagedObjectContext:APP_DELEGATE.managedObjectContext];
            ANArticle *article = [[ANArticle alloc] initWithEntity:entity insertIntoManagedObjectContext:APP_DELEGATE.managedObjectContext];
            [[JSObjection defaultInjector] injectDependencies:article];
            
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
