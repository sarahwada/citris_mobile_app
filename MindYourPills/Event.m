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
@synthesize form;
@synthesize times;
@synthesize firstDay;
@synthesize lastDay;
@synthesize scheduleTimes;

@synthesize mon;
@synthesize tue;
@synthesize wed;
@synthesize thu;
@synthesize fri;
@synthesize sat;
@synthesize sun;


@synthesize missedFlag;

-(Event*) initWithName:(NSString *) n andReason:(NSString *) r andAmount:(NSString *) a andForm:(NSString *) f andTimes:(uint) t andFirstDay:(NSDate *) fd andLastDay:(NSDate *) ld andScheduleTimes:(NSMutableArray *) st andMon:(BOOL) mon andTue:(BOOL) tues andWed:(BOOL) wed andThu:(BOOL) thu andFri:(BOOL) fri andSat:(BOOL) sat andSun:(BOOL) sun{
    /**
     * Event: one medicine event entered by the user in the "Add Medication" page.  The event includes information
     * about repetition and end date, but must use getEventsInNextHour() to actually compute the events within the
     * next hour.
     */
    self = [super init];
    if (self) {
        name = n;
        reason = r;
        amount = a;
        form = f;
        times = t;
        missedFlag = 0;
        firstDay = fd;
        lastDay = ld;
        scheduleTimes = st;
    }
    return self;
}


-(NSMutableArray*) getEventsInNextHour {
    /**
     * Returns an NSMutableArray of NSDate objects of all the instances of this event within the next hour.
     * Calculation of the values is based on: firstDay, lastDay, and scheduleTimes.
     */
    NSDate *currTime = [NSDate date];
    NSMutableArray *eventsInNextHour = [[NSMutableArray alloc] init];
    if (firstDay > currTime || lastDay < currTime) {
        return eventsInNextHour;
    }
    
    
    return eventsInNextHour;
}

@end
