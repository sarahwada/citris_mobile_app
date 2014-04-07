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
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *form;
@property (nonatomic) uint times;

@property (nonatomic, strong) NSDate *firstDay;
@property (nonatomic, strong) NSDate *lastDay;
@property (nonatomic, strong) NSMutableArray *scheduleTimes;

// Flag to show if medication has been missed or not
@property (nonatomic, strong) NSNumber *missedFlag;

-(Event*) initWithName:(NSString *) n andReason:(NSString *) r andAmount:(NSString *) a andForm:(NSString *) f andTimes:(uint) t andFirstDay:(NSDate *) fd andLastDay:(NSDate *) ld andScheduleTimes:(NSMutableArray *) st;


@end
