//
//  ANArticlesViewController.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/21/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANPageViewController.h"

@class ANArticle;

@interface ANArticlesViewController : ANPageViewController

@property (strong, nonatomic) NSArray *articles;
@property (weak, nonatomic) ANArticle *selectedArticle;

@end
