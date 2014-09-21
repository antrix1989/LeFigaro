//
//  ANViewController.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/21/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANViewController.h"

@interface ANViewController ()

@end

@implementation ANViewController

#pragma mark - Public

+ (instancetype)newInstance
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass(self) bundle:nil];
    id newInstance = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
    
    return newInstance;
}

@end
