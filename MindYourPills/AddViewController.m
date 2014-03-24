//
//  AddViewController.m
//  MindYourPills
//
//  Created by Yujun Cho on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *reasonTextField;
@property (nonatomic, weak) IBOutlet UITextField *amountTextField;
@property (nonatomic, weak) IBOutlet UITextField *frequencyTextField;
@property (nonatomic, weak) IBOutlet UIPickerView *formPickerView;
@property (nonatomic, weak) IBOutlet UIDatePicker *timeDatePicker;

@end

@implementation AddViewController

@synthesize nameTextField;
@synthesize reasonTextField;
@synthesize amountTextField;
@synthesize frequencyTextField;
@synthesize formPickerView;
@synthesize timeDatePicker;

- (IBAction)save:(id)sender
{
    NSString *name = nameTextField.text;
    NSString *reason = reasonTextField.text;
    NSString *amount = amountTextField.text;
    NSString *form = formPickerView.description;
    NSDate *date = timeDatePicker.date;
    NSInteger *frequency = frequencyTextField.text.integerValue;

}

- (IBAction)exit:(id)sender
{
    
}

@end
