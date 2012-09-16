//
//  PeopleDetailController.h
//  sqliteDemo
//
//  Created by 郑 晋 on 12-9-16.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleDetailController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *blog;


@end
