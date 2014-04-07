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

// To fill the upcomingTableView, will be sorted
@property (nonatomic, weak) NSMutableArray *eventsList;
@property (nonatomic) NSMutableArray *sortedUpcomingEvents;
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
    self.sortedUpcomingEvents = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    // To set a class to load the table cells for
    // If want to personalize cells: change to registerNib and create a custom UITableViewCell
    [self.upcomingTableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    //[_upcomingTableView setDelegate:<(id UITableViewDelegate)>];
    //[_upcomingTableView setDelegate:<(id UITableViewDelegate)>];

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
    double times = 10;
    Event *event = [[Event alloc] initWithName:name andReason:reason andAmount:amount andForm:form andTimes:times];
    
    EventsList *eventsList = [EventsList sharedEventsList];
    NSMutableArray *sharedEventsList = eventsList.sharedEvents;
    
    [sharedEventsList addObject:event];
    [sharedEventsList addObject:event];


    Event *eventAdd = [[Event alloc] init];
    NSDate * currDateTime = [NSDate date];
    
    for (int i = 0; i < [sharedEventsList count]; i++) {
        //handling
        eventAdd = sharedEventsList[i];
        
        //NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        //[outputFormatter setDateFormat:@"HH:mm:ss"];
        
        //NSString *newDateString = [outputFormatter stringFromDate:now];
        //NSLog(@"newDateString %@", newDateString);
        //[outputFormatter release];

        
        NSLog(@"here");
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
    
    // Check for out of bounds indexing
    Event *event = [self.sortedUpcomingEvents objectAtIndex:indexPath.row];
    cell.textLabel.text = event.name;
    
    return cell;
}


@end
