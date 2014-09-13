//
//  ANCategory.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANCategory.h"
#import "ANApiClient.h"

@implementation ANCategory

#pragma mark - Public

+ (void)getAllCategoriesInBackground:(ANArrayResultBlock)block
{
    [ANApiClient getAllCategories:block];
}

@end
