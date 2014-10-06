//
//  ANGetArticleWithIDRequest.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 10/6/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANGetArticleWithIDRequest.h"
#import "ANApiRequest_Private.h"
#import "ANArticle.h"

@implementation ANGetArticleWithIDRequest

#pragma mark - Public

- (void)getArticleWithID:(NSString *)articleID withBlock:(ANObjectResultBlock)block
{
    if (!block) {
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"/article/%@", articleID];
    
    [self.manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"ANArticle" inManagedObjectContext:APP_DELEGATE.managedObjectContext];
        ANArticle *article = [[ANArticle alloc] initWithEntity:entity insertIntoManagedObjectContext:APP_DELEGATE.managedObjectContext];
        [[JSObjection defaultInjector] injectDependencies:article];
        
        [article readFromDictionary:responseObject];
        
        block(article, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
        
        if (block) {
            block(false, error);
        }
    }];
}

@end
