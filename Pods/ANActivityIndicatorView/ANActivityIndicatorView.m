// ANActivityIndicatorView.m
//
// Copyright (c) 2014 Sergey Demchenko (https://github.com/antrix1989)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ANActivityIndicatorView.h"

@implementation ANActivityIndicatorView

#pragma mark - Public

- (id)initWithNibName:(NSString *)nibName
{
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    self = (ANActivityIndicatorView *)[nibObjects objectAtIndex:0];
    
    if (self.customActivityIndicator) {
        NSArray *pngAssetsPaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:nil];
        NSArray *animationImagesPaths = [pngAssetsPaths filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF contains %@", self.customActivityImageNamePattern]];
        
        NSMutableArray *animationImages = [NSMutableArray new];
        for (NSString *path in animationImagesPaths) {
            NSString *imageName = [UIImage imageNamed:[[path lastPathComponent] stringByDeletingPathExtension]];
            [animationImages addObject:imageName];
        }
        
        self.customActivityIndicator.animationImages = animationImages;
        // Repeat the annimation forever.
        self.customActivityIndicator.animationRepeatCount = 0;
    }
    
    return self;
}

- (void)showInView:(UIView *)view
{
    [self.customActivityIndicator startAnimating];
    
    self.frame = view.bounds;
    self.center = view.center;
    [view addSubview:self];
}

- (void)hide
{
    [self.customActivityIndicator startAnimating];
    [self removeFromSuperview];
}

@end
