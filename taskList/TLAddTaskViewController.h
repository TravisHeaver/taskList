//
//  TLAddTaskViewController.h
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLTask.h"
@protocol TLAddTaskDelegate
-(void)didCancel;
-(void)didAddTask:(TLTask *)task;
@end

@interface TLAddTaskViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) id <TLAddTaskDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;



- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@end
