//
//  TLViewController.h
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLAddTaskViewController.h"
#import "TLDetailTaskViewController.h"

@interface TLViewController : UIViewController <TLAddTaskDelegate,UITableViewDataSource,UITableViewDelegate, TLDetailTaskDelegate>

@property(strong,nonatomic) NSMutableArray *taskObjectsArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) TLTask *taskToSend;

- (IBAction)reorderBarButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@end
