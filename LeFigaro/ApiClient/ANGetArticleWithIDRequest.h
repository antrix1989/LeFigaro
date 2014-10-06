//
//  ANGetArticleWithIDRequest.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 10/6/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANApiRequest.h"

@interface ANGetArticleWithIDRequest : ANApiRequest

/**
 Returns article with specified remote id.
 @param articleID Article's id on server.
 @param block Block to return.
 */
- (void)getArticleWithID:(NSString *)articleID withBlock:(ANObjectResultBlock)block;

@end
