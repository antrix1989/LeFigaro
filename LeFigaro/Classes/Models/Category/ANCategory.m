//
//  ANCategory.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANCategory.h"
#import "ANSubCategory.h"
#import "ANApiClient.h"

@implementation ANCategory

#pragma mark - ANJSONSerializable

- (void)readFromDictionary:(NSDictionary *)dictionary
{
    self.name = dictionary[@"category"];
    
    NSMutableArray *subCategories = [NSMutableArray new];
    
    for (NSDictionary *categoryInfo in dictionary[@"subcategories"]) {
        ANSubCategory *subCategory = [[JSObjection defaultInjector] getObject:ANSubCategory.class];
        [subCategory readFromDictionary:categoryInfo];
        
        [subCategories addObject:subCategory];
    }
    
    self.subCategories = subCategories;
}

#pragma mark - Public

+ (void)getAllCategoriesInBackground:(ANArrayResultBlock)block
{
    ANApiClient *apiClient = [[JSObjection defaultInjector] getObject:ANApiClient.class];
    
    [apiClient getAllCategories:block];
}

@end
