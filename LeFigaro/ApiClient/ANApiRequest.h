//
//  ANApiClient.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

extern const int ANParseError;
extern NSString *const ANLeFigaroErrorDomain;

@interface ANApiRequest : NSObject

- (void)cancelAllOperations;

@end
