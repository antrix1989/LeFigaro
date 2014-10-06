//
//  ANApiClient.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import <AFNetworking.h>
#import "ANApiRequest.h"
#import "ANApiRequest_Private.h"
#import "ANCategory.h"
#import "ANSubCategory.h"
#import "ANArticle.h"

NSString *const kBaseUrlString = @"http://figaro.service.yagasp.com";
NSString *const ANLeFigaroErrorDomain = @"com.lefigaro.app";
const int ANParseError = 1;

@implementation ANApiRequest

objection_register_singleton(ANApiRequest)

#pragma mark - Public

- (void)cancelAllOperations
{
    [self.manager.operationQueue cancelAllOperations];
}

#pragma mark - Private

- (AFHTTPRequestOperationManager *)manager
{
    dispatch_sync(self.syncDispatchQueue, ^{
        if (!_manager) {
            _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrlString]];
            [_manager.operationQueue setMaxConcurrentOperationCount:1];
        }
    });
    
    return _manager;
}

- (dispatch_queue_t)syncDispatchQueue
{
    if (!_syncDispatchQueue) {
        _syncDispatchQueue = dispatch_queue_create("com.lfhttpclient.syncDispatchQueue", NULL);
    }
    
    return _syncDispatchQueue;
}

@end
