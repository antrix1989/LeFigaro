//
//  ANApiRequest_ANApiRequest_Private.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 10/6/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANApiRequest.h"
#import <AFNetworking.h>

@interface ANApiRequest ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) dispatch_queue_t syncDispatchQueue;

@end
