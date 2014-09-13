//
//  ANViewController.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANHomeViewController.h"
#import "ANCategory.h"
#import "ANCategoryViewCell.h"

static NSString *kCategoryViewCell = @"ANCategoryViewCell";

@interface ANHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *categoriesCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *categoriesPageControl;

@property (strong, nonatomic) NSArray *categories;

@end

@implementation ANHomeViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.categoriesCollectionView registerNib:[UINib nibWithNibName:kCategoryViewCell bundle:nil] forCellWithReuseIdentifier:kCategoryViewCell];
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
        self.categoriesPageControl.numberOfPages = categories.count;
        [self.categoriesCollectionView reloadData];
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.categories count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ANCategoryViewCell *categoryViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryViewCell forIndexPath:indexPath];
    
    return categoryViewCell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cellSize = (CGSize) {.width = self.view.frame.size.width, .height = self.view.frame.size.height - self.categoriesPageControl.frame.size.height};
    
    return cellSize;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.categoriesCollectionView.frame.size.width;
    NSUInteger pageNumber = (self.categoriesCollectionView.contentOffset.x / pageWidth);
    
    self.categoriesPageControl.currentPage = pageNumber;
}

@end
