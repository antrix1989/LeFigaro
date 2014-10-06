//
//  ANGetAllArticlesForSubCategoryRequest.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 10/6/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANApiRequest.h"

@class ANSubCategory;

@interface ANGetAllArticlesForSubCategoryRequest : ANApiRequest

- (void)getAllArticlesForSubCategory:(ANSubCategory *)subCategory withBlock:(ANArrayResultBlock)block;

@end
