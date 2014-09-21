//
//  ANArticleViewCell.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/21/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANArticleViewCell.h"
#import "ANArticle.h"
#import "ANArticleHtmlGenerator.h"

@interface ANArticleViewCell ()

@property (weak, nonatomic) IBOutlet UIWebView *articleContentWebView;

@property (strong, nonatomic) ANArticleHtmlGenerator *articleHtmlGenerator;

@end

@implementation ANArticleViewCell

objection_requires(@"articleHtmlGenerator")

#pragma mark - UICollectionReusableView

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    [self.articleContentWebView loadHTMLString:@"" baseURL:nil];
}

#pragma mark - Public

- (void)setArticle:(ANArticle *)article
{
    _article = article;
    
    ANActivityIndicatorView *activityIndicatorView = [[ANActivityIndicatorView alloc] initWithNibName:@"ANActivityIndicatorView"];
    [activityIndicatorView showInView:self];
    [article loadWithBlock:^(BOOL succeeded, NSError *error) {
        [activityIndicatorView hide];
        
        if (succeeded) {
            [self.articleContentWebView loadHTMLString:[self.articleHtmlGenerator generateHtml:article] baseURL:nil];
        }
    }];
}

@end
