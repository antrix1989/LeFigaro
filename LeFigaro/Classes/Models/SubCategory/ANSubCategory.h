//
//  ANSubCategory.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/14/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANJSONSerializable.h"

@interface ANSubCategory : NSObject <ANJSONSerializable>

/**
 Name of sub category.
 */
@property (strong, nonatomic) NSString *name;

/**
 ID of this sub category on server.
 */
@property (strong, nonatomic) NSString *remoteID;

/**
 Returns asynchronously list of all articles for this sub category.
 @param block The block to execute. The block should have the following argument signature: (NSArray *objects, NSError *error)
 */
- (void)getAllArticlesInBackground:(ANArrayResultBlock)block;

@end
