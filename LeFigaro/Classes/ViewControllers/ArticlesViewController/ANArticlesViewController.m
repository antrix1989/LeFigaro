//
//  ANArticlesViewController.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/21/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANArticlesViewController.h"
#import "ANArticleViewCell.h"

static NSString *kArticleViewCell = @"ANArticleViewCell";

@interface ANArticlesViewController ()

@end

@implementation ANArticlesViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:kArticleViewCell bundle:nil] forCellWithReuseIdentifier:kArticleViewCell];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.pageControl.numberOfPages = self.articles.count;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    NSUInteger selectedArticleIndex = [self.articles indexOfObject:self.selectedArticle];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:selectedArticleIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.articles count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ANArticleViewCell *articleViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kArticleViewCell forIndexPath:indexPath];
    [[JSObjection defaultInjector] injectDependencies:articleViewCell];
    
    articleViewCell.article = self.articles[indexPath.item];
    
    return articleViewCell;
}

@end
