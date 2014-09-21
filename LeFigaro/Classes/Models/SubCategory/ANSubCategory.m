//
//  ANSubCategory.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/14/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANSubCategory.h"
#import "ANApiClient.h"

@interface ANSubCategory ()

@property (strong, nonatomic) ANApiClient *apiClient;

@end

@implementation ANSubCategory

objection_requires(@"apiClient")

#pragma mark - ANJSONSerializable

- (void)readFromDictionary:(NSDictionary *)dictionary
{
    self.name = dictionary[@"name"];
    self.remoteID = dictionary[@"id"];
}

#pragma mark - Public

- (void)getAllArticlesInBackground:(ANArrayResultBlock)block
{
    [self.apiClient getAllArticlesForSubCategory:self withBlock:block];
}

@end
