//
//  ANArticle.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/14/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANArticle.h"

@implementation ANArticle

#pragma mark - ANJSONSerializable

- (void)readFromDictionary:(NSDictionary *)dictionary
{
    self.title = dictionary[@"title"];
    self.subTitle = dictionary[@"subtitle"];
    self.imageUrl = dictionary[@"thumb"][@"link"];
}

@end
