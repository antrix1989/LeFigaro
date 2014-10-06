//
//  ANViewController.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANHomeViewController.h"
#import "ANCategory.h"
#import "ANSubCategory.h"
#import "ANCategoryViewCell.h"
#import "ANArticlesViewController.h"
#import "ANArticle.h"

static NSString *kCategoryViewCell = @"ANCategoryViewCell";

@interface ANHomeViewController () <ANCategoryViewCellDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) ANCategoryViewCell* currentCategoryViewCell;

@property (strong, nonatomic) NSArray *categories;

@end

@implementation ANHomeViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:kCategoryViewCell bundle:nil] forCellWithReuseIdentifier:kCategoryViewCell];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    ANActivityIndicatorView *activityIndicatorView = [[ANActivityIndicatorView alloc] initWithNibName:@"ANActivityIndicatorView"];
    [activityIndicatorView showInView:self.view];
    [ANCategory getAllCategoriesInBackground:^(NSArray *categories, NSError *error) {
        [activityIndicatorView hide];
        
        self.categories = categories;
        self.pageControl.numberOfPages = categories.count;
        [self.collectionView reloadData];
        
        ANCategory *category = [self.categories objectAtIndex:0];
        self.navigationItem.title = category.name;
    }];
    
    self.searchBar.text = @"";
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.searchBar resignFirstResponder];
    
    [super viewWillDisappear:animated];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.categories count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ANCategoryViewCell *categoryViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryViewCell forIndexPath:indexPath];
    categoryViewCell.delegate = self;
    categoryViewCell.category = [self.categories objectAtIndex:indexPath.item];
    self.currentCategoryViewCell = categoryViewCell;
    
    return categoryViewCell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    NSUInteger pageNumber = (self.collectionView.contentOffset.x / pageWidth);
    
    if (self.pageControl.currentPage != pageNumber) {
        self.searchBar.text = @"";
    }
    
    self.pageControl.currentPage = pageNumber;
    
    ANCategory *category = [self.categories objectAtIndex:self.pageControl.currentPage];
    self.navigationItem.title = category.name;
}

#pragma mark - ANCategoryViewCellDelegate

- (void)didSelectArticle:(ANArticle *)article amongArticles:(NSArray *)articles
{
    ANArticlesViewController *articlesViewController = [ANArticlesViewController newInstance];
    articlesViewController.selectedArticle = article;
    articlesViewController.articles = articles;

    [self.navigationController pushViewController:articlesViewController animated:YES];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.currentCategoryViewCell filterArticlesByText:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

@end
