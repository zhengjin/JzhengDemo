//
//  DetailController.m
//  Sqlite3Demo
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "DetailController.h"

@implementation DetailController

@synthesize Save;

- (void)viewDidUnload {
    [self setSave:nil];
    [super viewDidUnload];
}

- (IBAction)SaveClick:(id)sender {
    NSLog(@"%s","alter click");
    
    //弹出alter
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" 
                          message:@"单击了动态按钮！"
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:@"OK",nil];
    [alert show];

}

@end
