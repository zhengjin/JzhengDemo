//
//  MasterViewController.h
//  IOSDemo
//
//  Created by 郑 晋 on 12-12-27.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
