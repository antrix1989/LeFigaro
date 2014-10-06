//
//  ANHomeViewCell.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

@class ANCategory;
@class ANArticle;

@protocol ANCategoryViewCellDelegate <NSObject>

- (void)didSelectArticle:(ANArticle *)article amongArticles:(NSArray *)articles;

@end

@interface ANCategoryViewCell : UICollectionViewCell

@property (strong, nonatomic) ANCategory* category;
@property (weak, nonatomic) id<ANCategoryViewCellDelegate> delegate;

- (void)filterArticlesByText:(NSString *)text;

@end
