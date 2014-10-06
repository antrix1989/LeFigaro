//
//  ANApiGetAllCategories.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 10/6/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANApiRequest.h"

@interface ANApiGetAllCategoriesRequest : ANApiRequest

/**
 Returns all categories from server.
 @param block Block to return.
 */
- (void)getAllCategories:(ANArrayResultBlock)block;

@end
