//
//  TLTaskModel.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLTaskModel.h"

@implementation TLTaskModel

-(id)init
{
    self = [self initWithData:Nil];
    return self;
}

-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    self.title = data[TASK_TITLE];
    self.description = data[TASK_DESCRIPTION];
    self.date = data[TASK_DATE];
    self.complete = data[TASK_COMPLETION];
    
    return self;
}
@end
