//
//  TLViewController.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLViewController.h"
#import "TLTaskModel.h"
#import "TLTask.h"
#import "TLAddTaskViewController.h"


@interface TLViewController ()

@end

@implementation TLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *stringFromDate = [formatter ]
    
    NSDate *currentDate = [[NSDate alloc] init];
    
    NSDictionary *testDictionary = @{TASK_COMPLETION:@YES,TASK_DATE:currentDate, TASK_DESCRIPTION:@"just a description", TASK_TITLE:@"title!!"};
    
    TLTaskModel *array = [[TLTaskModel alloc] init];
    
//    NSLog(@"%@  %@", array.title, array.date);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reorderButtonPressed:(id)sender {
}

- (IBAction)addButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"viewControllerToAddTaskSegue" sender:sender];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        if ([segue.destinationViewController isKindOfClass:[TLAddTaskViewController class]]) {
            //add button was pressed - heading to add task view controller
            TLAddTaskViewController *nextViewController = segue.destinationViewController;
            nextViewController.delegate = self;
            NSLog(@"delegate set");
        }
    }
}

#pragma delegate methods
-(void)didCancel
{
    NSLog(@"should cancel...");
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)didAddTask:(TLTask *)task
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    //add the task to the list
}

@end
