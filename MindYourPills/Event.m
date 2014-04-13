//
//  Event.m
//  MindYourPills
//
//  Created by Sarah Wada on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "Event.h"
#import "EventToDisplay.h"

@implementation Event

@synthesize name;
@synthesize reason;
// debug: string for now, might change (int + string value)
@synthesize amount;
@synthesize form;
// Number of times per day or repeated????
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
    NSLog(@"In getEventsInNextHour");
    NSDate *now = [NSDate date];
    NSMutableArray *eventsInNextHour = [[NSMutableArray alloc] init];
    
    NSTimeInterval secondsInOneHour = 1 * 60 * 60;
    NSDate *dateOneHourAhead = [now dateByAddingTimeInterval:secondsInOneHour];
    
    //if (firstDay > now || lastDay < now) {
    //    return eventsInNextHour;
    //}
    
    // Get the current day, and the day of +1hour
    NSDateFormatter* dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dayFormatter setDateFormat:@"EEEE"];
    NSString *weekDay =  [dayFormatter stringFromDate:now];
    NSString *weekDayPlusHour = [dayFormatter stringFromDate:dateOneHourAhead];

    // Get the current time, and time of +1 hour
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm"];
    NSDate *timeNow = [timeFormatter dateFromString:[timeFormatter stringFromDate:now]];
    NSDate *timePlusHour = [timeFormatter dateFromString:[timeFormatter stringFromDate:dateOneHourAhead]];

    
    // If today has a medication reminder:
    if ((self.mon && ([weekDay isEqualToString: @"Monday"] || [weekDayPlusHour isEqualToString: @"Monday"])) ||
        (self.tue && ([weekDay isEqualToString: @"Tuesday"] || [weekDayPlusHour isEqualToString: @"Tuesday"])) ||
        (self.wed && ([weekDay isEqualToString: @"Wednesday"] || [weekDayPlusHour isEqualToString: @"Wednesday"])) ||
        (self.thu && ([weekDay isEqualToString: @"Thursday"] || [weekDayPlusHour isEqualToString: @"Thursay"])) ||
        (self.fri && ([weekDay isEqualToString: @"Friday"] || [weekDayPlusHour isEqualToString: @"Friday"])) ||
        (self.sat && ([weekDay isEqualToString: @"Saturday"] || [weekDayPlusHour isEqualToString: @"Saturday"])) ||
        (self.sun && ([weekDay isEqualToString: @"Sunday"] || [weekDayPlusHour isEqualToString: @"Sunday"]))) {

        // For all times today:
        for (int i = 0; i < [self.scheduleTimes count]; i++) {
            NSDate *scheduledTime = [timeFormatter dateFromString:self.scheduleTimes[i]];
            // If  timeNow <= scheduledTime <= timePlusHour:
            if(([timeNow compare: scheduledTime] != NSOrderedDescending) &&
               ([timePlusHour compare: scheduledTime] != NSOrderedAscending)) {
                EventToDisplay *addEvent = [[EventToDisplay alloc] initWithName:self.name andReason:self.reason andAmount:self.amount andForm:self.form andTimeToTake:scheduledTime];
                [eventsInNextHour addObject:addEvent];
            }
        }
    }
    return eventsInNextHour;
}

@end
