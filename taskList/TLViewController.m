//
//  TLViewController.m
//  taskList
//
//  Created by Travis Heaver on 12/7/13.
//  Copyright (c) 2013 Travis Heaver. All rights reserved.
//

#import "TLViewController.h"
#import "TLTask.h"
#import "TLAddTaskViewController.h"
#import "TLDetailTaskViewController.h"


@interface TLViewController ()

@end

@implementation TLViewController
-(NSMutableArray *)taskObjectsArray
{
    if (!_taskObjectsArray) {
        _taskObjectsArray = [[NSMutableArray alloc] init];
    }
    return _taskObjectsArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *stringFromDate = [formatter ]
    
//    NSDate *currentDate = [[NSDate alloc] init];
    
//    NSDictionary *testDictionary = @{TASK_COMPLETION:@YES,TASK_DATE:currentDate, TASK_DESCRIPTION:@"just a description", TASK_TITLE:@"title!!"};
    
//    NSLog(@"%@  %@", array.title, array.date);
    
    NSArray *tempTaskArray = [[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECT_ARRAY];
    for (int i = 0; i<[tempTaskArray count]; i++) {
        [self.taskObjectsArray addObject:[self taskFromArray:tempTaskArray[i]]];
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskObjectsArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    TLTask *taskAtIndex = [self.taskObjectsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = taskAtIndex.title;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateAsString = [formatter stringFromDate:taskAtIndex.date];

    cell.detailTextLabel.text = dateAsString;
    if (!taskAtIndex.completed) {
        if ([self isDateGreaterThanDate:[NSDate date] and:taskAtIndex.date]) {
            cell.backgroundColor = [UIColor redColor];
        }
        else cell.backgroundColor = [UIColor yellowColor];
    }
    else cell.backgroundColor = [UIColor greenColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLTask *taskAtIndex = [self.taskObjectsArray objectAtIndex:indexPath.row];
    
    //remove old object, toggle, add back,  save new object
    //remove
    [self.taskObjectsArray removeObjectAtIndex:indexPath.row];
    
    //togle
    taskAtIndex = [self toggleCompleted:taskAtIndex];
    
    //add back
    //save new
    
    [self didAddTask:taskAtIndex];
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    self.taskToSend = self.taskObjectsArray[indexPath.row];
    [self performSegueWithIdentifier:@"viewControllerToDetailTaskSegue" sender:tableView];
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.taskObjectsArray removeObjectAtIndex:indexPath.row];
        NSMutableArray *newTaskObjectsData = [[NSMutableArray alloc] init];
        
        for (TLTask *task in self.taskObjectsArray){
            [newTaskObjectsData addObject:[self taskObjectAsPropertyList:task]];
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:newTaskObjectsData forKey:TASK_OBJECT_ARRAY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(TLTask *)toggleCompleted : (TLTask *)task
{
    task.completed = !task.completed;
    return task;
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
        }
    }
    
    if ([sender isKindOfClass: [UITableView class]]) {
        if ([segue.destinationViewController isKindOfClass: [TLDetailTaskViewController class]])
        {
            //information button was pressed - heading to details
            TLDetailTaskViewController *nextViewController = segue.destinationViewController;
            nextViewController.delegate = self;
            nextViewController.taskDetail = self.taskToSend;
        }
    }
}

#pragma mark delegate methods
-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)didAddTask:(TLTask *)task
{
    [self.taskObjectsArray addObject:task];
    
    NSMutableArray *taskObjectsAsPropertyList = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECT_ARRAY] mutableCopy];
    
    if (!taskObjectsAsPropertyList) {
        taskObjectsAsPropertyList = [[NSMutableArray alloc] init];
    }
    [taskObjectsAsPropertyList addObject:[self taskObjectAsPropertyList:task]];
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyList forKey:TASK_OBJECT_ARRAY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self.tableView reloadData];
}
-(void)returnFromDetail
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark helper methods
-(NSDictionary *)taskObjectAsPropertyList: (TLTask *)taskObject
{
    NSDictionary *dictionary = @{TASK_TITLE: taskObject.title,TASK_DESCRIPTION:taskObject.description,TASK_DATE:taskObject.date,TASK_COMPLETION:@(taskObject.completed)};
    return dictionary;
    
}
-(TLTask *) taskFromArray:(NSDictionary *)dictionary
{
    TLTask *taskToReturn = [[TLTask alloc] initWithData:dictionary];
    return taskToReturn;
}
-(BOOL)isDateGreaterThanDate: (NSDate *)date and: (NSDate *)toDate;
{
    NSTimeInterval timeInterval = [date timeIntervalSinceDate:toDate];
    
    if (timeInterval > 0) {
        return YES;
    }
    else return NO;
    
}

@end
