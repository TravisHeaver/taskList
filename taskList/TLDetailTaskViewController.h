//
//  TLDetailTaskViewController.h
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLTask.h"
@protocol TLDetailTaskDelegate
-(void)returnFromDetail;
-(void)modifiedTask: (TLTask *) task;


@end


@interface TLDetailTaskViewController : UIViewController

@property (weak, nonatomic) id <TLDetailTaskDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) TLTask *taskDetail;

- (IBAction)editButtonPressed:(id)sender;

@end
