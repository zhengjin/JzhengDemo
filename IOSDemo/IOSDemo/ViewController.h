//
//  ViewController.h
//  IOSDemo
//
//  Created by 郑 晋 on 13-1-30.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) NSMutableDictionary *names;
@property (strong, nonatomic) NSMutableArray *keys;
@property (strong, nonatomic) NSDictionary *allNames;

@property (strong, nonatomic) IBOutlet UISearchBar *search;
@property (strong, nonatomic) IBOutlet UITableView *table;

- (void)resetSearch;
- (void)handleSearchForTeam:(NSString *)searchTerm;

@end
