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
@property (strong, nonatomic) NSString *subTitle;

/**
 Url of thumbnail image.
 */
@property (strong, nonatomic) NSString *imageUrl;

@end
