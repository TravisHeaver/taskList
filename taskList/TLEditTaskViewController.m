//
//  TLEditTaskViewController.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLEditTaskViewController.h"

@interface TLEditTaskViewController ()

@end

@implementation TLEditTaskViewController

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
    
    self.taskNameTextField.text = self.task.title;
    self.taskDescriptionTextView.text = self.task.description;
    self.taskDatePicker.date = self.task.date;
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

- (IBAction)saveBarButtonPressed:(id)sender {
    [self updateTask];
    [self.delegate saveButtonPressedDelegate:self.task];
}

#pragma mark helper methods
-(void)updateTask
{
    self.task.title = self.taskNameTextField.text;
    self.task.description = self.taskDescriptionTextView.text;
    self.task.date = self.taskDatePicker.date;
    self.task.completed = self.task.completed;
}
@end
