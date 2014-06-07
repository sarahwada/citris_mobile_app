//
//  scheduleTimesViewController.m
//  MindYourPills
//
//  Created by Yujun Cho on 4/6/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "scheduleTimesViewController.h"

@interface scheduleTimesViewController ()

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIButton *startDateButton;
@property (nonatomic, retain) IBOutlet UILabel *startDateLabel;
@property (nonatomic, retain) IBOutlet UIButton *endDateButton;
@property (nonatomic, retain) IBOutlet UILabel *endDateLabel;

@property (nonatomic) int currentTagNum;
@property (nonatomic) int timesPerDay;

@end

@implementation scheduleTimesViewController

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
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.startDateButton setTag:20];
    [self.endDateButton setTag:21];
    self.timesPerDay = 4;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)confirm:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
}

- (void)removeViews:(id)object{
    [[self.view viewWithTag:9] removeFromSuperview];
    UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:10];
    NSDate *date = datePicker.date;
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    if (self.currentTagNum == 21 || self.currentTagNum == 20){
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        switch (self.currentTagNum){
            case 20:
                self.startDateLabel.text = [dateFormatter stringFromDate:date];
                break;
            case 21:
                self.endDateLabel.text = [dateFormatter stringFromDate:date];
                break;
            default:
                break;
        }
    } else {
        [dateFormatter setDateStyle:NSDateFormatterNoStyle];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    }
    [[self.view viewWithTag:10] removeFromSuperview];
    [[self.view viewWithTag:11] removeFromSuperview];
}

- (void)dismissDatePicker:(id)sender{
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, 320, 216);
    [UIView beginAnimations:@"MoveOut" context:nil];
    [self.view viewWithTag:9].alpha = 0;
    [self.view viewWithTag:10].frame = datePickerTargetFrame;
    [self.view viewWithTag:11].frame = toolbarTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
}

- (IBAction)callDP:(UIButton*)sender {
    self.currentTagNum = sender.tag;
    if ([self.view viewWithTag:9]) {
        return;
    }
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height-216-44, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-216, 320, 216);
    
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor lightGrayColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)];
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    if (sender.tag == 20 || sender.tag == 21) {
        [datePicker setDatePickerMode:UIDatePickerModeDate];
    } else {
        [datePicker setDatePickerMode:UIDatePickerModeTime];
    }
    datePicker.tag = 10;
    [datePicker setBackgroundColor:[UIColor whiteColor]];
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
    toolBar.tag = 11;
    toolBar.barStyle = UIBarStyleDefault;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0.5;
    [UIView commitAnimations];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.timesPerDay;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
//    Event *nextEvent = [self.myMedications objectAtIndex:indexPath.row];
//    [cell.textLabel setText:[NSString stringWithFormat:@"Next event: %@", [nextEvent name]]];
    
    return cell;
}

@end
