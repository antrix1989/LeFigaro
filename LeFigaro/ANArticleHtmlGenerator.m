//
//  ANArticleHtmlGenerator.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/21/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANArticleHtmlGenerator.h"
#import "ANArticle.h"

const int kImageWidth = 300;
const int kImageHeight = 200;

@implementation ANArticleHtmlGenerator

#pragma mark - Public

- (NSString *)generateHtml:(ANArticle *)article
{
    NSString *imageUrl = [NSString stringWithFormat:article.imageUrl, kImageWidth, kImageHeight];
    
    NSString *dateString = [NSDateFormatter localizedStringFromDate:article.date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterMediumStyle];
    
    NSMutableString *html = [NSMutableString stringWithFormat:@"<html><body><img src=\"%@\" alt=\"\" style=\"width:%dpx;height:%dpx\"><h2>%@</h2><h4>%@ %@<h4/><h3>%@</h3>%@</body></html>", imageUrl, kImageWidth, kImageHeight, article.title, article.author, dateString, article.subtitle, article.content];
    
    return html;
}

@end
