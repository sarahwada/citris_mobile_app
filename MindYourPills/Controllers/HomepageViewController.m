//
//  HomepageViewController.m
//  MindYourPills
//
//  Created by Yujun Cho on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "HomepageViewController.h"
#import "AddViewController.h"  
#import "EditViewController.h"
#import "Event.h"
#import "EventsList.h"
#import "EventToDisplay.h"

@interface HomepageViewController ()

@property (nonatomic, weak) IBOutlet UITableView *upcomingTableView;
@property (nonatomic, weak) IBOutlet UIImageView *nextPillImageView;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *reasonLabel;

// the shared EventsList object
@property (nonatomic, weak) NSMutableArray *eventsList;
// A dictionary mapping {eventTime, eventToDisplay}
@property (nonatomic) NSMutableDictionary *upcomingEvents;
// Event times, that is eventually sorted
@property (nonatomic) NSMutableArray *sortedEventTimes;
// An NSMutableArray that stores the events, in sorted order
@property (nonatomic) NSMutableArray *allEvents;

@end

@implementation HomepageViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.upcomingEvents = [NSMutableDictionary dictionary];
    self.sortedEventTimes = [NSMutableArray array];
    self.allEvents = [NSMutableArray array];

    
    [self loadInitialData];
    
    // To set a class to load the table cells for
    // If want to personalize cells: change to registerNib and create a custom UITableViewCell
    [self.upcomingTableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    //[_upcomingTableView setDelegate:<(id UITableViewDelegate)>];
    //[_upcomingTableView setDelegate:<(id UITableViewDelegate)>];
    [self.upcomingTableView setSeparatorInset:(UIEdgeInsetsZero)];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)listPills:(id)sender
{
    NSLog(@"listpills button Tapped!");
    EditViewController *evc = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    [self presentViewController:evc animated:YES completion:nil];
}

- (IBAction)addPills:(id)sender
{
    NSLog(@"addpills button Tapped!");
    AddViewController *addVC = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    [self presentViewController:addVC animated:NO completion:nil];

}

- (void)loadInitialData {
    // Load next HOUR worth of data into the mutable array
    
    // --------------------------
    // Adding test item
    // --------------------------
    NSString *name1 = @"name1";
    NSString *name2 = @"name2";
    
    NSString *reason = @"reason1";
    NSString *amount = @"amount1";
    NSString *form = @"form1";
    NSDate *fd = [NSDate date];
    // to make end date
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    NSDate *ld = [cal dateByAddingComponents:components toDate:fd options:0];
    
    NSMutableArray *st = [[NSMutableArray alloc] init];
    for (int i = 0; i < 24*4; i++) {
        NSDate *date = [NSDate date];
        NSLog(@"date:%@", date);
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setMinute:15*i];
        NSDate *time = [cal dateByAddingComponents:components toDate:date options:0];
        [st addObject:time];
    }
    
    NSLog(@"Schedule Times array: %@", st);
    
    BOOL mon = false;
    BOOL tue = false;
    BOOL wed = false;
    BOOL thu = true;
    BOOL fri = false;
    BOOL sat = false;
    BOOL sun = false;
    
    double times = 10;
    Event *event1 = [[Event alloc] initWithName:name1 andReason:reason andAmount:amount andForm:form andTimes:times andFirstDay:fd andLastDay:ld andScheduleTimes:st andMon:mon andTue:tue andWed:wed andThu:thu andFri:fri andSat:sat andSun:sun];
    Event *event2 = [[Event alloc] initWithName:name2 andReason:reason andAmount:amount andForm:form andTimes:times andFirstDay:fd andLastDay:ld andScheduleTimes:st andMon:mon andTue:tue andWed:wed andThu:thu andFri:fri andSat:sat andSun:sun];

    
    EventsList *eventsList = [EventsList sharedEventsList];
    NSMutableArray *sharedEventsList = eventsList.sharedEvents;
    
    [sharedEventsList addObject:event1];
    [sharedEventsList addObject:event2];

    // -------------------------
    // Testing code ends here
    // -------------------------
    
    
    // -------------------------
    // TODO: refactor all code below this
    // -------------------------
    // The event we're looking at
    Event *eventToAdd = [[Event alloc] init];
    // The array of events in the next hour for this array
    NSMutableArray *eventsToDisplay = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [sharedEventsList count]; i++) {
        // getEventOccurrencesInNextHour
        eventToAdd = sharedEventsList[i];
        eventsToDisplay = [eventToAdd getEventOccurrencesInNextHour];
      
        if (eventsToDisplay != NULL) {
            for (int i = 0; i < [eventsToDisplay count]; i++) {
                EventToDisplay *eventToDisplay = eventsToDisplay[i];
                NSDate *reminderTime = eventToDisplay.timeToTake;
                
                // If reminder is already in the dictionary:
                if ([self.upcomingEvents objectForKey: reminderTime] != NULL) {
                    [self.upcomingEvents[reminderTime] addObject:eventToDisplay];
                // If reminder not in the dictionary
                } else {
                    [self.sortedEventTimes addObject: reminderTime];
                    self.upcomingEvents[reminderTime] = [NSMutableArray arrayWithObjects:eventToDisplay, NULL];
                }
        
            }
        NSLog(@"Homepage medication list: iterating through sharedEventsList");
        }
    }
        
    // Sort the event times and store the ordered events in ALLEVENTS
    [self.sortedEventTimes sortUsingSelector:@selector(compare:)];
    for (int i = 0; i < [self.sortedEventTimes count]; i++) {
        // get next sorted event time
        NSMutableArray *listOfEvents = self.upcomingEvents[self.sortedEventTimes[i]];
        for (int j = 0; j < [listOfEvents count]; j++) {
            [self.allEvents addObject:listOfEvents[j]];
        }
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections. Required for tableView
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section. Required for tableView
    return [self.allEvents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set the cell for a visible row in the table. Required for tableView
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    EventToDisplay *event = [self.allEvents objectAtIndex:indexPath.row];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *time =  [dateFormatter stringFromDate:event.timeToTake];

    cell.textLabel.text = time;
    
    return cell;
}

- (void)setUpTestInfo {
    
}


@end
