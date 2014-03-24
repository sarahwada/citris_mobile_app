//
//  Event.h
//  MindYourPills
//
//  Created by Sarah Wada on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *reason;
// debug: string for now, might change (int + string value)
@property (nonatomic, strong) NSString *amount;

// debug: is stored value of UIPickerView an NSString?
@property (nonatomic, strong) NSString *form;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSNumber *frequency;

// Flag to show if medication has been missed or not
@property (nonatomic, strong) NSNumber *missedFlag;

@end
