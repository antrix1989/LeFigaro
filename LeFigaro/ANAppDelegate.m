//
//  ANAppDelegate.m
//  LeFigaro
//
//  Created by Sergey Demchenko on 9/13/14.
//  Copyright (c) 2014 antrix1989. All rights reserved.
//

#import "ANAppDelegate.h"

@implementation ANAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    JSObjectionInjector *injector = [JSObjection createInjector:[JSObjectionModule new]];
    [JSObjection setDefaultInjector:injector];
    
    [[JSObjection defaultInjector] injectDependencies:self];
    
    return YES;
}

@end
