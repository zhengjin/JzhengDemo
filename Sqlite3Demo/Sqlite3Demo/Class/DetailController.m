//
//  DetailController.m
//  Sqlite3Demo
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "DetailController.h"

@implementation DetailController

@synthesize Blog;
@synthesize Gender;
@synthesize Name;
@synthesize Age;

@synthesize greetingText;

- (void)viewDidUnload {
    [self setName:nil];
    [self setAge:nil];
    [self setGender:nil];
    [self setBlog:nil];
    [super viewDidUnload];
}

- (IBAction)SaveClick:(id)sender {
    NSLog(@"%s","alter click");
    
    //弹出alter
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" 
                          message:@"是否保存！"
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:@"取消",nil];
    [alert show];

}

//单击return
-(IBAction)textFiledReturnEditing:(id)sender {
    [sender resignFirstResponder];
    NSLog(@"触发Did End On Exit");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Blog.text=self.greetingText;
}

@end
