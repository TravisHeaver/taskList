//
//  TLTask.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLTask.h"

@implementation TLTask

-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.title = data[TASK_TITLE];
        self.description = data[TASK_DESCRIPTION];
        self.date = data[TASK_DATE];
        self.completed = [data[TASK_COMPLETION] boolValue];
    }
    return self;
}

-(id)init
{
    self = [self initWithData:Nil];
    return self;
}
@end
