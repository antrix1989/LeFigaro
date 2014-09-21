//
//  ANArticle.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/14/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANArticle.h"
#import "ANApiClient.h"

@interface ANArticle ()

@property (strong, nonatomic) ANApiClient *apiClient;

@end

@implementation ANArticle

objection_requires(@"apiClient")

#pragma mark - ANJSONSerializable

- (void)readFromDictionary:(NSDictionary *)dictionary
{
    self.remoteID = dictionary[@"id"];
    if (!self.remoteID) {
        self.remoteID = dictionary[@"_id"];
    }
    self.title = dictionary[@"title"];
    self.subtitle = dictionary[@"subtitle"];
    self.imageUrl = dictionary[@"thumb"][@"link"];
    self.content = dictionary[@"content"];
    self.author = dictionary[@"author"];
    
    if ([dictionary[@"date"] intValue] > 0) {
        self.date = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"date"] intValue]];
    }
}

#pragma mark - Public

- (void)loadWithBlock:(ANBooleanResultBlock)block
{
    [self.apiClient getArticleWithID:self.remoteID withBlock:^(NSObject *object, NSError *error) {
        BOOL result = object && [object isKindOfClass:self.class];
        if (result) {
            ANArticle *tmpArticle = (ANArticle *)object;
            self.title = tmpArticle.title;
            self.subtitle = tmpArticle.subtitle;
            self.imageUrl = tmpArticle.imageUrl;
            self.content = tmpArticle.content;
            self.author = tmpArticle.author;
        }
        
        if (block) {
            block(result, error);
        }
    }];
}

@end
