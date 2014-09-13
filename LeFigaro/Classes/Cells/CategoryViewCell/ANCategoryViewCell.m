//
//  ANHomeViewCell.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANCategoryViewCell.h"
#import "ANCategory.h"
#import "ANSubCategory.h"
#import "ANArticleCell.h"
#import "ANArticle.h"

static NSString *kArticleCell = @"ANArticleCell";

@interface ANCategoryViewCell () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *promotedArticleImageView;
@property (weak, nonatomic) IBOutlet UITableView *articlesTableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) ANSubCategory *firstSubCategory;
@property (strong, nonatomic) NSArray *articles;
@property (strong, nonatomic) ANArticle *promotedArticle;

@end

@implementation ANCategoryViewCell

- (void)awakeFromNib
{
    [self.articlesTableView registerNib:[UINib nibWithNibName:kArticleCell bundle:nil] forCellReuseIdentifier:kArticleCell];
}

#pragma mark - Public

- (void)setCategory:(ANCategory *)category
{
    _category = category;
    
    self.titleLabel.text = category.name;
    
    if (category.subCategories.count > 0) {
        self.firstSubCategory = category.subCategories[0];
        
        ANActivityIndicatorView *activityIndicatorView = [[ANActivityIndicatorView alloc] initWithNibName:@"ANActivityIndicatorView"];
        [activityIndicatorView showInView:self];
        [self.firstSubCategory getAllArticlesInBackground:^(NSArray *objects, NSError *error) {
            [activityIndicatorView hide];
            
            NSMutableArray *articles = [objects mutableCopy];
            
            if (articles.count > 0) {
                self.promotedArticle = articles[0];
                [articles removeObjectAtIndex:0];
            }
            
            self.articles = articles;
            
            [self.articlesTableView reloadData];
        }];
    }
    
    [self.articlesTableView reloadData];
}

- (void)setPromotedArticle:(ANArticle *)promotedArticle
{
    _promotedArticle = promotedArticle;
    
    NSString *imageUrl = [NSString stringWithFormat:promotedArticle.imageUrl, (int)self.promotedArticleImageView.frame.size.width, (int)self.promotedArticleImageView.frame.size.height];
    [self.promotedArticleImageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ANArticleCell *articleCell = [tableView dequeueReusableCellWithIdentifier:kArticleCell forIndexPath:indexPath];
    articleCell.article = self.articles[indexPath.row];
    
    return articleCell;
}

@end
