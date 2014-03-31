//
//  AddViewController.m
//  MindYourPills
//
//  Created by Yujun Cho on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "AddViewController.h"
#import "EventsList.h"
#import "Event.h"


@interface AddViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *reasonTextField;
@property (nonatomic, weak) IBOutlet UITextField *amountTextField;

@property (nonatomic, weak) IBOutlet UIStepper *timesStepper;
@property (nonatomic, weak) IBOutlet UIPickerView *formPickerView;

@end

@implementation AddViewController

@synthesize nameTextField;
@synthesize reasonTextField;
@synthesize amountTextField;
@synthesize timesStepper;
@synthesize formPickerView;

BOOL mon = false;
BOOL tue = false;
BOOL wed = false;
BOOL thu = false;
BOOL fri = false;
BOOL sat = false;
BOOL sun = false;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)confirm:(id)sender
{

    NSString *name = nameTextField.text;
    NSString *reason = reasonTextField.text;
    NSString *amount = amountTextField.text;
    NSString *form = formPickerView.description;
    //NSDate *endDate; // TODO: IMPLEMENT IN FRONT END
    double times = timesStepper.value;

    
    //NSLog(@"name: %@, reason: %@, amount: %@, form: %@, times:%f", name, reason, amount, form, times);
    EventsList *eventsList = [EventsList sharedEventsList];
    Event *eventToAdd = [[Event alloc] initWithName:name andReason:reason andAmount:amount andForm:form andTimes:times];

    NSLog(@"%@", eventToAdd);
    [eventsList.sharedEvents addObject:eventToAdd];
    NSLog(@"%@", eventsList.sharedEvents[0]);
    //NSLog(@"added event");
}

- (IBAction)cancel:(id)sender
{
    //[self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)monday:(id)sender
{
    mon = true;
}

- (IBAction)tuesday:(id)sender
{
    tue = true;
}


- (IBAction)wednesday:(id)sender
{
    wed = true;
}

- (IBAction)thursday:(id)sender
{
    thu = true;
}

- (IBAction)friday:(id)sender
{
    fri = true;
}

- (IBAction)saturday:(id)sender
{
    sat = true;
}

- (IBAction)sunday:(id)sender
{
    sun = true;
}

@end
