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

@interface HomepageViewController ()

@property (nonatomic, weak) IBOutlet UITableView *upcomingTableView;
@property (nonatomic, weak) IBOutlet UIImageView *nextPillImageView;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *reasonLabel;

// the shared EventsList object
@property (nonatomic, weak) NSMutableArray *eventsList;
//
@property (nonatomic) NSDictionary *sortedUpcomingEvents;
@property (nonatomic) NSMutableArray *sortedEventTimes;
@end

@implementation HomepageViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.sortedUpcomingEvents = [[NSDictionary alloc] init];
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
    [self presentViewController:addVC animated:YES completion:nil];

}

- (void)loadInitialData {
    // Load next HOUR worth of data into the mutable array
    
    // iterate, add events within the next hour to the sortedEvents NSMutableArray
    // sort NSMutableArray
    
    // added test item
    NSString *name = @"name1";
    NSString *reason = @"reason1";
    NSString *amount = @"amount1";
    NSString *form = @"form1";
    NSDate *fd = [NSDate date];
    NSDate *ld = [NSDate date];
    NSMutableArray *st = [[NSMutableArray alloc] init];
    BOOL mon = false;
    BOOL tue = false;
    BOOL wed = false;
    BOOL thu = false;
    BOOL fri = false;
    BOOL sat = false;
    BOOL sun = false;
    
    double times = 10;
    Event *event = [[Event alloc] initWithName:name andReason:reason andAmount:amount andForm:form andTimes:times andFirstDay:fd andLastDay:ld andScheduleTimes:st andMon:mon andTue:tue andWed:wed andThu:thu andFri:fri andSat:sat andSun:sun];
    
    EventsList *eventsList = [EventsList sharedEventsList];
    NSMutableArray *sharedEventsList = eventsList.sharedEvents;
    
    [sharedEventsList addObject:event];
    [sharedEventsList addObject:event];


    Event *eventAdd = [[Event alloc] init];
    NSMutableArray *eventArray = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *eventsDict = [NSMutableDictionary dictionary];
    NSMutableArray *eventKeys = [NSMutableArray array];
    
    for (int i = 0; i < [sharedEventsList count]; i++) {
        // getEventsInNextHour
        // put times in sortedUpcomingEvents dict with (k,v) = (time, event)
        // put times in sortedEventTimes array
        eventAdd = sharedEventsList[i];
        eventArray = [eventAdd getEventsInNextHour];
        
        
        //handling
        eventAdd = sharedEventsList[i];
        //NSDate *eventKey = eventAdd.getKey();
        //if ([eventKeys containsObject:eventKey]) {
        //    [eventsDict[eventKey] addObject:[eventAdd]];
        //} else {
        //    eventsDict[eventKey] = [NSMutableArray arrayWithObjects:eventAdd];
        //    [eventKeys addObject:[eventKey]];
        //}
        
        //NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        //[outputFormatter setDateFormat:@"HH:mm:ss"];
        
        //NSString *newDateString = [outputFormatter stringFromDate:now];
        //NSLog(@"newDateString %@", newDateString);
        //[outputFormatter release];

        
        NSLog(@"Homepage medication list: iterating through sharedEventsList");
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
    return [self.sortedUpcomingEvents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set the cell for a visible row in the table. Required for tableView
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDate *key = [self.sortedEventTimes objectAtIndex:indexPath.row];
    // DICTIONARY has (key, list_of_events_at_this_time) --> change to display list of events
    Event *event = [self.sortedUpcomingEvents objectForKey:key];
    cell.textLabel.text = event.name;
    
    return cell;
}


@end
