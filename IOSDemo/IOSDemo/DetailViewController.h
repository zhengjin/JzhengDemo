//
//  DetailViewController.h
//  IOSDemo
//
//  Created by 郑 晋 on 12-12-27.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
