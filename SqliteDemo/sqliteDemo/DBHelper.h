//
//  DBHelper.h
//  sqliteDemo
//
//  Created by 郑 晋 on 12-9-25.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface DBHelper : NSObject
{
    sqlite3 *database;
}

@property(readonly,nonatomic)sqlite3 *database;

+ (DBHelper *) newInstance;

- (void) openDatabase;
- (void) closeDatabase;
- (NSString *) getDatabaseFullPath;
- (void) createDatabaseIfNeeded;
- (sqlite3_stmt *) executeQuery:(NSString *) query;

- (void)createtable;
- (void)createTable:(NSString*)name WithFields:(NSArray*)fields;
- (void)insertInto:(NSString*)tableName Fields:(NSArray*)fields Values:(NSArray*)values;
- (NSArray*)selectFrom:(NSString*)table;
- (NSInteger)getLastIdFromTable:(NSString*)table;

@end
