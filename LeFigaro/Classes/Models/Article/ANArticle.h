//
//  ANArticle.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/14/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANJSONSerializable.h"

@interface ANArticle : NSObject <ANJSONSerializable>

/**
 ID of this article on server.
 */
@property (strong, nonatomic) NSString *remoteID;

/**
 Title of article.
 */
@property (strong, nonatomic) NSString *title;

/**
 Subtitle of article.
 */
@property (strong, nonatomic) NSString *subtitle;

/**
 Url of thumbnail image.
 */
@property (strong, nonatomic) NSString *imageUrl;

/**
 Html content of this article.
 */
@property (strong, nonatomic) NSString *content;

/**
 Author of this article.
 */
@property (strong, nonatomic) NSString *author;

/**
 Date of this article.
 */
@property (strong, nonatomic) NSDate *date;

/**
 Loads model's data in background.
 @param block The block to execute. The block should have the following argument signature: (BOOL succeeded, NSError *error)
 */
- (void)loadWithBlock:(ANBooleanResultBlock)block;

@end
