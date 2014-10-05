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
@property (weak, nonatomic) IBOutlet UILabel *promotedArticleTitleLabel;

@property (strong, nonatomic) ANSubCategory *firstSubCategory;
@property (strong, nonatomic) NSArray *articles;
@property (strong, nonatomic) NSArray *filteredArticles;
@property (strong, nonatomic) ANArticle *promotedArticle;

@end

@implementation ANCategoryViewCell

- (void)awakeFromNib
{
    [self.articlesTableView registerNib:[UINib nibWithNibName:kArticleCell bundle:nil] forCellReuseIdentifier:kArticleCell];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.promotedArticleImageView.image = nil;
}

#pragma mark - IBAction

- (IBAction)onPromotedArticleTapped:(id)sender
{
    [self.delegate didSelectArticle:self.promotedArticle amongArticles:self.allArticles];
}

#pragma mark - Public

- (void)filterArticlesByText:(NSString *)text
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"title like[cd] '*%1$@*' OR subtitle like[cd] '*%1$@*'", text]];
    self.filteredArticles = [self.articles filteredArrayUsingPredicate:predicate];
    [self.articlesTableView reloadData];
}

- (void)setCategory:(ANCategory *)category
{
    _category = category;
    
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
            self.filteredArticles = articles;
            
            [self.articlesTableView reloadData];
        }];
    }
    
    [self.articlesTableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filteredArticles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ANArticleCell *articleCell = [tableView dequeueReusableCellWithIdentifier:kArticleCell forIndexPath:indexPath];
    articleCell.article = self.filteredArticles[indexPath.row];
    
    return articleCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didSelectArticle:self.filteredArticles[indexPath.row] amongArticles:self.allArticles];
}

#pragma mark - Private

- (void)setPromotedArticle:(ANArticle *)promotedArticle
{
    _promotedArticle = promotedArticle;
    
    NSString *imageUrl = [NSString stringWithFormat:promotedArticle.imageUrl, (int)self.promotedArticleImageView.frame.size.width, (int)self.promotedArticleImageView.frame.size.height];
    [self.promotedArticleImageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.promotedArticleTitleLabel.text = promotedArticle.title;
}

- (NSArray *)allArticles
{
    NSMutableArray *allArticles = [[NSMutableArray alloc] initWithCapacity:self.articles.count + 1];
    [allArticles addObjectsFromArray:self.filteredArticles];
    [allArticles insertObject:self.promotedArticle atIndex:0];
    
    return allArticles;
}

@end
