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

@synthesize weekdays;

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
        
        weekdays;//TODO: add [mon - sun] to weekdays NSMutableArray
        
        // deprecated
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

-(EventToDisplay*) getFirstOccurrence {
    /**
     *  Retrieves the first occurence in the future, for this event.
     *  @return: the EventToDisplay of the next occurrence of this item
     */
    
    NSDate *now = [NSDate date];
    // get day (in numeric form) -1 (??? indexed at 1 i think?)
    
    // for i in range(1,7)
    //      day = day + i % 7
    //      index into array
    //      if DAY :
    //          for time in scheduletimes:
    //              format time (look at code below)
    //              if time > now:
    //                  create new EventToDisplay event
    //                  return event
    
    EventToDisplay *addEvent = [[EventToDisplay alloc] initWithName:self.name andReason:self.reason andAmount:self.amount andForm:self.form andTimeToTake:scheduleTimes[0]];
    return addEvent;
}

-(NSMutableArray *) getOccurrencesFromRange:(NSDate *)startDate endDate:(NSDate *)endDate {
    /**
     *  Retrieves all occurrences from the time range [startDate, endDate]
     *  @param startDate: a NSDate object with date and time; the first date/time 
     *      to begin looking for occurences for
     *  @param endDate: a NSDate object iwth date and time, the last date/time
     *      to use occurences for
     */
    
    // get now
    // make a copy of startdate
    NSMutableArray *occurrences = [NSMutableArray init];
    
    // To increment the day of the datetime object
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    
    // while (startdate compare:enddate != descending): //so startdate can equal enddate
    //      get startdate (numeric form) -1 (??? indexed at 1 i think?)
    //      startdate = [cal dateByAddingComponents:components toDate:fd options:0]
    //      if (weekdays[startdate::day]):
    //          for time in scheduletimes:
    //              format scheduletimes(look at code below)
    //              if (now compare:startdate == descending) &&
    //                  now compare: enddate == ascneding):
    //                  EventToDisplay event = new...
    //                  [OCCURRENCES addobject: eventtodisplay]
    //      increment start date by 1

    return occurrences;
}

//Deprecated
-(NSMutableArray*) getEventOccurrencesInNextHour {
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
    
    if (([firstDay compare:now] == NSOrderedDescending) ||
        ([lastDay compare:now] == NSOrderedAscending)) {
        return eventsInNextHour;
    }
    
    // Get the current day, and the day of + 1hour
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

    NSLog(@"weekday: %@", weekDay);//debug
    NSLog(@"weekdayPlusHour: %@", weekDayPlusHour);//debug
    
    // If today has a medication reminder:
    if ((self.mon && ([weekDay isEqualToString: @"Monday"] || [weekDayPlusHour isEqualToString: @"Monday"])) ||
        (self.tue && ([weekDay isEqualToString: @"Tuesday"] || [weekDayPlusHour isEqualToString: @"Tuesday"])) ||
        (self.wed && ([weekDay isEqualToString: @"Wednesday"] || [weekDayPlusHour isEqualToString: @"Wednesday"])) ||
        (self.thu && ([weekDay isEqualToString: @"Thursday"] || [weekDayPlusHour isEqualToString: @"Thursay"])) ||
        (self.fri && ([weekDay isEqualToString: @"Friday"] || [weekDayPlusHour isEqualToString: @"Friday"])) ||
        (self.sat && ([weekDay isEqualToString: @"Saturday"] || [weekDayPlusHour isEqualToString: @"Saturday"])) ||
        (self.sun && ([weekDay isEqualToString: @"Sunday"] || [weekDayPlusHour isEqualToString: @"Sunday"]))) {
        NSLog(@"today has a med reminder");//debug
        // For all times today:
        for (int i = 0; i < [self.scheduleTimes count]; i++) {
            NSDate *scheduledTime = [timeFormatter dateFromString:[timeFormatter stringFromDate:self.scheduleTimes[i]]];
            NSLog(@"Scheduled time (should be time of day): %@", scheduledTime);//debug
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
