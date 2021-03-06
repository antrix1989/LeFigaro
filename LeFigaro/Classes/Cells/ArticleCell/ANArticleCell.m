//
//  ANArticleCell.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/21/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANArticleCell.h"
#import "ANArticle.h"

@interface ANArticleCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;

@end

@implementation ANArticleCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.thumbnailImageView.image = nil;
    self.titleLabel.text = @"";
    self.subTitleLabel.text = @"";
}

#pragma mark - Publice

- (void)setArticle:(ANArticle *)article
{
    _article = article;
    
    self.titleLabel.text = article.title;
    self.subTitleLabel.text = article.subtitle;
    NSString *imageUrl = [NSString stringWithFormat:article.imageUrl, (int)self.thumbnailImageView.frame.size.width, (int)self.thumbnailImageView.frame.size.height];
    [self.thumbnailImageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

@end
