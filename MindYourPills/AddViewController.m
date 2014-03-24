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


- (IBAction)save:(id)sender
{
    NSString *name = nameTextField.text;
    NSString *reason = reasonTextField.text;
    NSString *amount = amountTextField.text;
    NSString *form = formPickerView.description;
    double times = timesStepper.value;

    NSMutableArray * eventsList = [EventsList sharedEventListInstance];
    Event *eventToAdd = [[Event alloc] initWithName:name andReason:reason andAmount:amount andForm:form andTimes:times];

    [eventsList addObject:eventToAdd];
    
}

- (IBAction)exit:(id)sender
{
    
}


- (IBAction)monday:(id)sender
{
    
}

- (IBAction)tuesday:(id)sender
{
    
}


- (IBAction)wednesday:(id)sender
{
    
}

- (IBAction)thursday:(id)sender
{
    
}

- (IBAction)friday:(id)sender
{
    
}

- (IBAction)saturday:(id)sender
{
    
}

- (IBAction)sunday:(id)sender
{
    
}

@end
