//
//  ANApiClient.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

extern const int ANParseError;
extern NSString *const ANLeFigaroErrorDomain;

@class ANSubCategory;

@interface ANApiClient : NSObject

- (void)cancelAllOperations;

- (void)getAllCategories:(ANArrayResultBlock)block;

- (void)getAllArticlesForSubCategory:(ANSubCategory *)subCategory withBlock:(ANArrayResultBlock)block;

- (void)getArticleWithID:(NSString *)articleID withBlock:(ANObjectResultBlock)block;

@end
