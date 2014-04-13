//
//  EventToDisplay.h
//  MindYourPills
//
//  Created by Sarah Wada on 4/12/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventToDisplay : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *form;
@property (nonatomic, strong) NSDate *timeToTake;

-(EventToDisplay*) initWithName:(NSString *) n andReason:(NSString *) r andAmount:(NSString *) a andForm:(NSString *) f andTimeToTake:(NSDate *) t;

@end
