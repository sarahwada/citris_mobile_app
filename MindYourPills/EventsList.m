//
//  EventsList.m
//  MindYourPills
//
//  Created by Jeffrey Deng on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "EventsList.h"

@implementation EventsList

static NSMutableArray *sharedEventListInstance = nil;

+ (NSMutableArray *) sharedEventListInstance {
 
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEventListInstance = [[self alloc] init];
    });
    
    return sharedEventListInstance;
}

- (id) init {
    self = [super init];
    return self;
}

@end
