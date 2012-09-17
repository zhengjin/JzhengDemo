//
//  PeopleDetailController.h
//  sqliteDemo
//
//  Created by 郑 晋 on 12-9-16.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PeopleDetailController;
@class Player;

@protocol PeopleDetailsViewControllerDelegate <NSObject>

- (void)playerDetailsViewControllerDidCancel:(PeopleDetailController *)controller;
- (void)playerDetailsViewController:(PeopleDetailController *)controller didAddPlayer:(Player *)player;

@end

@interface PeopleDetailController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UITextField *txtGender;
@property (weak, nonatomic) IBOutlet UITextField *txtBlog1;

@property (nonatomic,weak) id <PeopleDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
