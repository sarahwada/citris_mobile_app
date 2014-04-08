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

-(Event*) initWithName:(NSString *) n andReason:(NSString *) r andAmount:(NSString *) a andForm:(NSString *) f andTimes:(uint) t andFirstDay:(NSDate *) fd andLastDay:(NSDate *) ld andScheduleTimes:(NSMutableArray *) st andMon:(BOOL) mond andTue:(BOOL) tues andWed:(BOOL) wedn andThu:(BOOL) thur andFri:(BOOL) frid andSat:(BOOL) satu andSun:(BOOL) sund {
    /**
     * Event: one medicine event entered by the user in the "Add Medication" page.
     * The event includes information about repetition and end date, but must use
     * getEventsInNextHour() to actually compute the events within the next hour.
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
        mon = mond;
        tue = tues;
        wed = wedn;
        thu = thur;
        fri = frid;
        sat = satu;
        sun = sund;
    }
    return self;
}


-(NSMutableArray*) getEventsInNextHour {
    /**
     * Returns an NSMutableArray of NSDate objects of all the instances of this event
     * within the next hour.
     *
     * Calculation of the values is based on: firstDay, lastDay, and scheduleTimes.
     * Weekday calculations start from Monday, ie Monday's integer value is 1.
     */
    NSDate *now = [NSDate date];
    NSMutableArray *eventsInNextHour = [[NSMutableArray alloc] init];

    if (firstDay > now || lastDay < now) {
        return eventsInNextHour;
    }
    
    NSDateFormatter *weekday = [[NSDateFormatter alloc] init];
    NSLocale *deLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
    // Get the numeric value of the day
    [weekday setDateFormat: @"e"];
    // Set weekday to start from mon = 1
    [weekday setLocale:deLocale];
    
    NSLog(@"The day of the week is: %@", [weekday stringFromDate:now]);

    
    return eventsInNextHour;
}

@end
