//
//  EditViewController.m
//  MindYourPills
//
//  Created by Yujun Cho on 3/23/14.
//  Copyright (c) 2014 Sarah Wada. All rights reserved.
//

#import "EditViewController.h"
#import "AddViewController.h"
#import "HomepageViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)addMedicine:(id)sender
{
    NSLog(@"Add button Tapped!");
    AddViewController *avc = [[AddViewController alloc] initWithNibName:@"AddViewController"
                                                                   bundle:nil];
    [self presentViewController:avc animated:YES completion:nil];
}

- (IBAction)confirm: (id)sender
{
    NSLog(@"Confirm button tapped!");
    HomepageViewController *hvc = [[HomepageViewController alloc] initWithNibName:@"HomepageViewController"
                                                                           bundle:nil];
    [self presentViewController:hvc animated:YES completion:nil];
}

- (IBAction)cancel: (id)sender
{
    NSLog(@"Cancel button tapped!");
    HomepageViewController *hvc = [[HomepageViewController alloc] initWithNibName:@"HomepageViewController"
                                                                           bundle:nil];
    [self presentViewController:hvc animated:YES completion:nil];
}

@end
