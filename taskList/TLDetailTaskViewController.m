//
//  TLDetailTaskViewController.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLDetailTaskViewController.h"
#import "TLEditTaskViewController.h"
@interface TLDetailTaskViewController ()

@end

@implementation TLDetailTaskViewController

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
    
    self.taskLabel.text = self.taskDetail.title;
    self.detailLabel.text = self.taskDetail.description;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateAsString = [formatter stringFromDate:self.taskDetail.date];
    self.dateLabel.text = dateAsString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        if ([segue.destinationViewController isKindOfClass: [TLEditTaskViewController class]] )
        {
            //heading to the edit task view
            
            TLEditTaskViewController *nextViewController = segue.destinationViewController;
            nextViewController.task = self.taskDetail;
            nextViewController.delegate = self;
        }
    }
}

- (IBAction)editButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"detailToEditTaskSegue" sender:sender];
}

#pragma mark edit delegates
-(void)saveButtonPressedDelegate:(TLTask *)editedTask
{
    self.taskDetail = editedTask;
    [self didUpdateTask];
    [self.navigationController popToViewController:self animated:YES];
}

-(void)didUpdateTask
{
    self.taskLabel.text = self.taskDetail.title;
    self.detailLabel.text = self.taskDetail.description;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:self.taskDetail.date];
    self.dateLabel.text =stringFromDate;
    
    [self.delegate updateTask];
    NSLog(@"update task should have been called");
}
@end
