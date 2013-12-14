//
//  TLEditTaskViewController.h
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLTask.h"
#import "TLEditTaskViewController.h"

@protocol TLEditTaskDelegate
-(void)saveButtonPressedDelegate: (TLTask *)editedTask;

@end

@interface TLEditTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak,nonatomic) id <TLEditTaskDelegate> delegate;

@property (strong, nonatomic) TLTask *task;
@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *taskDatePicker;

- (IBAction)saveBarButtonPressed:(id)sender;

@end
