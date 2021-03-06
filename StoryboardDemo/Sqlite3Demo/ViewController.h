//
//  ViewController.h
//  Sqlite3Demo
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *albumList;

@property(nonatomic,retain) NSMutableDictionary *states;
@property(nonatomic,retain) NSArray *datasource;

-(void)setupArray;

@end
