//
//  DetailController.h
//  Sqlite3Demo
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *Save;//保存按钮对象

- (IBAction)SaveClick:(id)sender;//单击事件

@end
