//
//  TLViewController.h
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLAddTaskViewController.h"

@interface TLViewController : UIViewController <TLAddTaskDelegate>

- (IBAction)reorderButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@end
