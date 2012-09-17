//
//  ViewController.h
//  sqliteDemo
//
//  Created by 郑 晋 on 12-9-15.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *PeopleTableView;

@property (nonatomic,strong) NSMutableArray *peopleList;

- (void)BindingDataSource;

#pragma mark - add delegate


@end
