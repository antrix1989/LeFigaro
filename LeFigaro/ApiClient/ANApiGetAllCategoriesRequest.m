//
//  ANApiGetAllCategories.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 10/6/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANApiGetAllCategoriesRequest.h"
#import "ANApiRequest_Private.h"
#import "ANCategory.h"

@implementation ANApiGetAllCategoriesRequest

#pragma mark - Public

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
            
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"ANCategory" inManagedObjectContext:APP_DELEGATE.managedObjectContext];
            ANCategory *category = [[ANCategory alloc] initWithEntity:entity insertIntoManagedObjectContext:APP_DELEGATE.managedObjectContext];
            [[JSObjection defaultInjector] injectDependencies:category];
            
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

@end
