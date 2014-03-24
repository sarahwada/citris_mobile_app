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

@interface HomepageViewController ()
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)listPills:(id)sender
{
    NSLog(@"listpills button Tapped!");
}

- (IBAction)addPills:(id)sender
{
    NSLog(@"addpills button Tapped!");
    AddViewController *addVC = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    [self presentViewController:addVC animated:YES completion:nil];

}
@end
