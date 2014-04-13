//
//  EventToDisplay.m
//  MindYourPills
//
//  Created by Sarah Wada on 4/12/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "EventToDisplay.h"

@implementation EventToDisplay

@synthesize name;
@synthesize reason;
// debug: string for now, might change (int + string value)
@synthesize amount;
@synthesize form;
@synthesize timeToTake;


-(EventToDisplay*) initWithName:(NSString *) n andReason:(NSString *) r andAmount:(NSString *) a andForm:(NSString *) f andTimeToTake:(NSDate *) t{
    self = [super init];
    if (self) {
        name = n;
        reason = r;
        amount = a;
        form = f;
        timeToTake = t;
    }
    return self;
}


@end