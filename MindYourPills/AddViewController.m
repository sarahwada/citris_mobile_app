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
#import "HomepageViewController.h"


@interface AddViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *reasonTextField;
@property (nonatomic, weak) IBOutlet UITextField *amountTextField;
@property (nonatomic, weak) IBOutlet UIButton *saturdayButton;
@property (nonatomic, weak) IBOutlet UIButton *fridayButton;
@property (nonatomic, weak) IBOutlet UIButton *thursdayButton;
@property (nonatomic, weak) IBOutlet UIButton *wednesdayButton;
@property (nonatomic, weak) IBOutlet UIButton *tuesdayButton;
@property (nonatomic, weak) IBOutlet UIButton *mondayButton;
@property (nonatomic, weak) IBOutlet UIButton *sundayButton;
@property (nonatomic, weak) IBOutlet UILabel *stepperValueLabel;

@property (nonatomic, weak) IBOutlet UIPickerView *formPickerView;
@property (weak, nonatomic) IBOutlet UIStepper *timesStepper;
@property (strong, nonatomic) NSArray *formsList;
@property (weak, nonatomic) NSString *selectedForm;

@property (nonatomic) BOOL mon;
@property (nonatomic) BOOL tue;
@property (nonatomic) BOOL wed;
@property (nonatomic) BOOL thu;
@property (nonatomic) BOOL fri;
@property (nonatomic) BOOL sat;
@property (nonatomic) BOOL sun;

@end

@implementation AddViewController

@synthesize nameTextField;
@synthesize reasonTextField;
@synthesize amountTextField;
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
    amountTextField.returnKeyType = UIReturnKeyDone;
    [amountTextField setDelegate:self];
    reasonTextField.returnKeyType = UIReturnKeyDone;
    [reasonTextField setDelegate:self];
    nameTextField.returnKeyType = UIReturnKeyDone;
    [nameTextField setDelegate:self];
    
    self.formsList = [[NSArray alloc] initWithObjects:@"Pill",@"Tablet",@"Shot",@"Herb", nil];
    self.mon = false;
    self.tue = false;
    self.wed = false;
    self.thu = false;
    self.fri = false;
    self.sat = false;
    self.sun = false;
    
    self.timesStepper.wraps = NO;
    self.timesStepper.autorepeat = YES;
    NSUInteger value = self.timesStepper.value;
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%02d", value];
    self.timesStepper.minimumValue = 0;
    self.timesStepper.maximumValue = 99;
    
    self.selectedForm = [self.formsList objectAtIndex:0];
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
    NSString *form = self.selectedForm;
    //NSDate *endDate; // TODO: IMPLEMENT IN FRONT END
    uint times = (uint)self.timesStepper.value;

    
    NSLog(@"name: %@, reason: %@, amount: %@, form: %@, times:%d", name, reason, amount, form, times);
    EventsList *eventsList = [EventsList sharedEventsList];
    Event *eventToAdd = [[Event alloc] initWithName:name andReason:reason andAmount:amount andForm:form andTimes:times];

    NSLog(@"%@", eventToAdd);
    [eventsList.sharedEvents addObject:eventToAdd];
    NSLog(@"%@", eventsList.sharedEvents[0]);
    
    NSLog(@"Confirm button Tapped!");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender
{
    NSLog(@"Cancel button Tapped!");
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)monday:(id)sender
{
    if (self.mon) {
        self.mon = false;
        [self.mondayButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"Monday not set");
    } else {
        self.mon = true;
        [self.mondayButton setTitle:@"X" forState:UIControlStateNormal];
        NSLog(@"Monday set");
    }
}

- (IBAction)tuesday:(id)sender
{
    if (self.tue) {
        self.tue = false;
        [self.tuesdayButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"Tuesday not set");
    } else {
        self.tue = true;
        [self.tuesdayButton setTitle:@"X" forState:UIControlStateNormal];
        NSLog(@"Tuesday set");
    }
}


- (IBAction)wednesday:(id)sender
{
    if (self.wed) {
        self.wed = false;
        [self.wednesdayButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"Wednesday not set");
    } else {
        self.wed = true;
        [self.wednesdayButton setTitle:@"X" forState:UIControlStateNormal];
        NSLog(@"Wednesday set");
    }
}

- (IBAction)thursday:(id)sender
{
    if (self.thu) {
        self.thu = false;
        [self.thursdayButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"Thursday not set");
    } else {
        self.thu = true;
        [self.thursdayButton setTitle:@"X" forState:UIControlStateNormal];
        NSLog(@"Thursday set");
    }
}

- (IBAction)friday:(id)sender
{
    if (self.fri) {
        self.fri = false;
        [self.fridayButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"Friday not set");
    } else {
        self.fri = true;
        [self.fridayButton setTitle:@"X" forState:UIControlStateNormal];
        NSLog(@"Friday set");
    }
}

- (IBAction)saturday:(id)sender
{
    if (self.sat) {
        self.sat = false;
        [self.saturdayButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"Friday not set");
    } else {
        self.sat = true;
        [self.saturdayButton setTitle:@"X" forState:UIControlStateNormal];
        NSLog(@"Friday set");
    }
}

- (IBAction)sunday:(id)sender
{
    if (self.sun) {
        self.sun = false;
        [self.sundayButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"Sunday not set");
    } else {
        self.sun = true;
        [self.sundayButton setTitle:@"X" forState:UIControlStateNormal];
        NSLog(@"Sunday set");
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [self.formsList count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.formsList objectAtIndex:row];
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Selected Row %d", row);
    switch(row)
    {
        case 0:
            self.selectedForm = @"Pill";
            break;
        case 1:
            self.selectedForm = @"Tablet";
            break;
        case 2:
            self.selectedForm = @"Shot";
            break;
        case 3:
            self.selectedForm = @"Herb";
            break;
    }
}
\
- (IBAction)changeValue:(UIStepper *)sender
{
    NSUInteger value = sender.value;
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%02d", value];
}


@end
