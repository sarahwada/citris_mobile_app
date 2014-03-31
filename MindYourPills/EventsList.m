//
//  EventsList.m
//  MindYourPills
//
//  Created by Jeffrey Deng on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "EventsList.h"

@interface EventsList ()

//@property (nonatomic, retain) NSMutableArray *sharedEvents;

@end

@implementation EventsList
@synthesize sharedEvents;
+ (EventsList *) sharedEventsList {
 
    static EventsList *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[EventsList alloc] init];
        shared.sharedEvents = [[NSMutableArray alloc] init];
    });

    return shared;
}

- (id) init {
    self = [super init];
    return self;
}

@end
