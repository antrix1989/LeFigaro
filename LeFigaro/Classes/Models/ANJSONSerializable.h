//
//  ANJSONSerializable.h
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

@protocol ANJSONSerializable <NSObject>

- (void)readFromDictionary:(NSDictionary *)dictionary;

@end
