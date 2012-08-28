//
//  ViewController.m
//  slider
//
//  Created by 郑 晋 on 12-8-26.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ViewController.h"

#import "sqlite3.h"

#define kDatabaseName @"database.sqlite3"

@implementation ViewController

@synthesize lblMessage;
@synthesize bt_go;
@synthesize databaseFilePath;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //获取数据库文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.databaseFilePath = [documentsDirectory stringByAppendingPathComponent:kDatabaseName];
    //打开或创建数据库
    sqlite3 *database;
    if (sqlite3_open([self.databaseFilePath UTF8String] , &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"打开数据库失败！");
    }
    //创建数据库表
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS (TAG INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    char *errorMsg;
    if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"创建数据库表错误: %s", errorMsg);
    }
    //执行查询
    NSString *query = @"SELECT TAG, FIELD_DATA FROM FIELDS ORDER BY TAG";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        //依次读取数据库表格FIELDS中每行的内容，并显示在对应的TextField
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //获得数据
            int tag = sqlite3_column_int(statement, 0);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            //根据tag获得TextField
            UITextField *textField = (UITextField *)[self.view viewWithTag:tag];
            //设置文本
            //textField.text = [[NSString alloc] initWithUTF8String:rowData];
            textField.text=@"sd";
        }
        sqlite3_finalize(statement);
    }
    //关闭数据库
    sqlite3_close(database);
    //当程序进入后台时执行写入数据库操作
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillResignActive:)
     name:UIApplicationWillResignActiveNotification
     object:app];
}

- (void)viewDidUnload
{
    [self setBt_go:nil];
    [self setLblMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)btnAction:(id)sender {
    NSLog(@"%s","alter click");
    
    //弹出alter
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" 
                                                    message:@"单击了动态按钮！"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:@"OK",nil]; 
    [alert show];*/
    
    //txt付值
    lblMessage.text=@"赋值";
    //[self performSegueWithIdentifier:@"otherPage"sender:self];
}

//程序进入后台时的操作，实现将当前显示的数据写入数据库
- (void)applicationWillResignActive:(NSNotification *)notification {
    //打开数据库
    sqlite3 *database;
    if (sqlite3_open([self.databaseFilePath UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"打开数据库失败！");
    }
    //向表格插入四行数据
    for (int i = 1; i <= 4; i++) { 
        //根据tag获得TextField
        UITextField *textField = (UITextField *)[self.view viewWithTag:i];
        //使用约束变量插入数据
        char *update = "INSERT OR REPLACE INTO FIELDS (TAG, FIELD_DATA) VALUES (?, ?);";
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i);
            sqlite3_bind_text(stmt, 2, [textField.text UTF8String], -1, NULL);
        }
        char *errorMsg = NULL;
        if (sqlite3_step(stmt) != SQLITE_DONE)
            NSAssert(0, @"更新数据库表FIELDS出错: %s", errorMsg);
        sqlite3_finalize(stmt);
    }
    //关闭数据库
    sqlite3_close(database);
}

@end
