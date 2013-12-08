//
//  TLAddTaskViewController.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLAddTaskViewController.h"

@interface TLAddTaskViewController ()

@end

@implementation TLAddTaskViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
    NSLog(@"Cancel button pressed");
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(id)sender {
    [self.delegate didAddTask:[self returnTask]];
}
#pragma helper methods
-(TLTask *)returnTask
{
    
    TLTask *task = [[TLTask alloc]init];
    task.name = self.taskNameTextField.text;
    task.description = self.taskDescriptionTextView.text;
    task.date = self.datePicker.date;
    
    return task;
}

@end
