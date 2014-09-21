//
//  ANArticleHtmlGenerator.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/21/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

@class ANArticle;

@interface ANArticleHtmlGenerator : NSObject

- (NSString *)generateHtml:(ANArticle *)article;

@end
