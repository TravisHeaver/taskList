//
//  TLDetailTaskViewController.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLDetailTaskViewController.h"

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
//    self.dateLabel.text
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

- (IBAction)editButtonPressed:(id)sender {
}
@end
