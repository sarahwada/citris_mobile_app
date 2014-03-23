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

// debug: is stored value of UIPickerView an NSString?
@synthesize form;
@synthesize date;
@synthesize frequency;

// Flag to show if medication has been missed or not
@synthesize missedFlag;

-(id) init {
    self = [super init];
    if (self) {
        missedFlag = 0;
    }
    return self;
}


@end
