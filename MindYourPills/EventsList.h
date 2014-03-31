//
//  EventsList.h
//  MindYourPills
//
//  Created by Jeffrey Deng on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventsList : NSObject

@property (nonatomic, retain) NSMutableArray *sharedEvents;
+ (EventsList *)sharedEventsList;

@end
