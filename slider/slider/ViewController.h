//
//  ViewController.h
//  slider
//
//  Created by 郑 晋 on 12-8-26.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *lblMessage;//textbox对象
@property (weak, nonatomic) IBOutlet UIButton *bt_go;//button对象

@property (copy, nonatomic) NSString *databaseFilePath;

- (IBAction)btnAction:(id)sender;

-(void)applicationWillResignActive:(NSNotification *)notification;

@end
