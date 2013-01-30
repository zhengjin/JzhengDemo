//
//  ViewController.h
//  IOSDemo
//
//  Created by 郑 晋 on 13-1-30.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSDictionary *names;
@property (strong, nonatomic) NSArray *keys;

@end
