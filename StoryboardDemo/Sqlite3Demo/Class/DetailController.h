//
//  DetailController.h
//  Sqlite3Demo
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *Blog;
@property (weak, nonatomic) IBOutlet UITextField *Gender;
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *Age;

@property (weak) NSString *greetingText;

- (IBAction)SaveClick:(id)sender;//单击事件

- (IBAction)textFiledReturnEditing:(id)sender;//return释放键盘

@end
