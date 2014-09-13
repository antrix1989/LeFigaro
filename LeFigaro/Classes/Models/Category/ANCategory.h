//
//  ANCategory.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANJSONSerializable.h"

@interface ANCategory : NSObject <ANJSONSerializable>

/**
 Name of category.
 */
@property (strong, nonatomic) NSString *name;

/**
 Sub categories of this category.
 */
@property (strong, nonatomic) NSArray *subCategories;

/**
 Returns asynchronously list of all categories.
 @param block The block to execute. The block should have the following argument signature: (NSArray *objects, NSError *error)
 */
+ (void)getAllCategoriesInBackground:(ANArrayResultBlock)block;

@end
