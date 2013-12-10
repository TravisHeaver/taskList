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
    self.taskNameTextField.delegate = self;
    self.taskDescriptionTextView.delegate = self;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self.taskDescriptionTextView resignFirstResponder];
        return NO;
    }
    else{
        return YES;
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [self.taskNameTextField resignFirstResponder];
        return NO;
    }
    else{
        return YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(id)sender {
    //TODO: test to make sure user has entered information
    [self.delegate didAddTask:[self returnTask]];

}

#pragma mark helper methods
-(TLTask *)returnTask
{
    TLTask *task = [[TLTask alloc]init];
    task.title = self.taskNameTextField.text;
    task.description = self.taskDescriptionTextView.text;
    task.date = self.datePicker.date;
    task.completed = NO;
    return task;
}
@end
