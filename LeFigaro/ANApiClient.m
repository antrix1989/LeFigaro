//
//  ANApiClient.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANApiClient.h"
#import "ANCategory.h"

@implementation ANApiClient

#pragma mark - PUblic

+ (void)getAllCategories:(ANArrayResultBlock)block
{
    if (!block) {
        return;
    }
    
    NSMutableArray *categories = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        ANCategory *category = [ANCategory new];
        [categories addObject:category];
    }
    
    block(categories, nil);
}

@end
