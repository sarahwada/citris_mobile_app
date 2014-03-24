//
//  Event.m
//  MindYourPills
//
//  Created by Sarah Wada on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize name;
@synthesize reason;
// debug: string for now, might change (int + string value)
@synthesize amount;
@synthesize compareTime;
@synthesize endDate;

// debug: is stored value of UIPickerView an NSString?
@synthesize form;
@synthesize times;

// Flag to show if medication has been missed or not
@synthesize missedFlag;

-(Event*) initWithName:(NSString *) n andReason:(NSString *) r andAmount:(NSString *) a andForm:(NSString *) f andTimes:(double) t {
    self = [super init];
    if (self) {
        name = n;
        reason = r;
        amount = a;
        form = f;
        times = t;
        missedFlag = 0;
        // For comparison in priority queue, implement when adding to priority queue
        compareTime = nil;
        endDate = nil;
    }
    return self;
}


@end
