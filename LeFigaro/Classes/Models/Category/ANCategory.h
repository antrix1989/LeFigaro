//
//  ANCategory.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

@interface ANCategory : NSObject

/**
 Returns asynchronously list of all categories.
 @param block The block to execute. The block should have the following argument signature: (NSArray *objects, NSError *error)
 */
+ (void)getAllCategoriesInBackground:(ANArrayResultBlock)block;

@end
