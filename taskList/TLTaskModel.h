//
//  TLTaskModel.h
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLTaskModel : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *description;
@property (nonatomic,strong) NSDate *date;
@property (nonatomic) BOOL complete;

-(id)initWithData:(NSDictionary *)data;
@end
