//
//  DBHelper.m
//  sqliteDemo
//
//  Created by 郑 晋 on 12-9-25.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "DBHelper.h"

@implementation DBHelper

static DBHelper *instance = nil;

NSString *DB_NAME = @"sample";
NSString *DB_EXT = @".sqlite";

@synthesize database;

+ (DBHelper *) newInstance{
    @synchronized(self) {
        if (instance == nil){
            instance = [[DBHelper alloc]init];
            [instance openDatabase];
        }
    }
    return instance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
            return instance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (void) openDatabase{
    if (!database){
        [self createDatabaseIfNeeded];
        int result = sqlite3_open([[self getDatabaseFullPath] UTF8String], &database);
        if (result != SQLITE_OK){
            NSAssert(0, @"Failed to open database");
        }
        else
        {
            [self createtable];
        }
    }
}

- (void) closeDatabase{
    if (database){
        sqlite3_close(database);
    }
}

- (void) createDatabaseIfNeeded{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //NSError *error;
    NSString *dbPath = [self getDatabaseFullPath];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    if(!success) {
        //create file
//        NSFileManager *fm=[NSFileManager defaultManager];
//        NSString *defaultDBPath = 
//            [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", DB_NAME, DB_EXT]];
//        success = [fm copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
//        NSLog(@"Database file copied from bundle to %@", dbPath);
//        if (!success){
//            NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
//        }
    } else {
        NSLog(@"Database file found at path %@", dbPath);
    }
}

- (void)createtable
{
    NSArray *myArray=[NSArray arrayWithObjects:@"id", @"name", @"age", @"gender", @"blog", nil];
    [self performSelector:
     @selector(createTable:WithFields:) withObject:[NSString stringWithFormat:@"%@",DB_NAME] withObject:myArray];
}

- (void)createTable:(NSString *)name WithFields:(NSArray *)fields
{
    if([fields count] < 1) {
        NSLog(@"Cannot create table with empty fields.");
        return;
    }
    
    char *err;
    
    NSString *cmd = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@'('%@' integer PRIMARY KEY autoincrement", name, [fields objectAtIndex:0]];
    
    for(NSInteger i = 1 ; i < [fields count] ; i++) {
        cmd = [NSString stringWithFormat:@"%@ , '%@' TEXT", cmd, [fields objectAtIndex:i]];
    }
    
    cmd = [NSString stringWithFormat:@"%@);", cmd];

    if(sqlite3_exec(database, [cmd UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"Failed to create table with command: %@", cmd);
    }
}

- (void)insertInto:(NSString *)tableName Fields:(NSArray *)fields Values:(NSArray *)values
{
    NSString *cmd = [NSString stringWithFormat:@"INSERT OR REPLACE INTO '%@'", tableName];
    
    NSString *_fields = [NSString stringWithFormat: @"('%@'", [fields objectAtIndex:0]];
    NSString *_values = [NSString stringWithFormat:@"(?", [values objectAtIndex:0]];
    
    for(NSInteger i = 1 ; i < [fields count] && i < [values count] ; i++) {
        _fields = [NSString stringWithFormat:@"%@, '%@'", _fields, [fields objectAtIndex:i]];
        _values = [NSString stringWithFormat:@"%@, ?", _values];
    }
    
    _fields = [NSString stringWithFormat:@"%@)", _fields];
    _values = [NSString stringWithFormat:@"%@)", _values];
    
    cmd = [NSString stringWithFormat:@"%@ %@ VALUES %@", cmd, _fields, _values];
    
    const char* sql = [cmd UTF8String];
    
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2(database, sql, -1, &stmt, NULL) == SQLITE_OK) {
        for(NSInteger i = 0 ; i < [values count] ; i++) {
            sqlite3_bind_text(stmt, (i + 1), [[values objectAtIndex:i] UTF8String], -1, NULL);
        }
    } else {
        NSLog(@"Could not prepare SQL command.");
    }
    
    int result = sqlite3_step(stmt);
    
    if(result != SQLITE_DONE)
        NSLog(@"Error when inserting row into table.");
    
    sqlite3_finalize(stmt);
}

//获取数据库地址
- (NSString *) getDatabaseFullPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", DB_NAME, DB_EXT]];
    return path;
}

- (NSArray*)selectFrom:(NSString *)table
{
    NSString *cmd = [NSString stringWithFormat:@"SELECT * FROM %@", table];
    
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2(database, [cmd UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        NSMutableArray *result = [[NSMutableArray alloc] init];
        
        int columnCount = sqlite3_column_count(stmt);
        
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            NSMutableArray *row = [[NSMutableArray alloc ] init];
            
            for(int i = 0 ; i < columnCount ; i++) {
                char *field = (char*) sqlite3_column_text(stmt, i);
                
                if(field == NULL) {
                    //[row addObject:nil];
                    continue;
                }
                
                NSString *fieldString = [[NSString alloc] initWithUTF8String:field];
                
                [row addObject:fieldString];
            }
            
            [result addObject:row];
        }
        
        return result;
    }         
    
    NSLog(@"Could not prepare SQL command.");
    
    return nil;
}

- (NSInteger)getLastIdFromTable:(NSString *)table
{
    NSString *cmd = [NSString stringWithFormat:@"SELECT ID FROM %@ ORDER BY ID DESC LIMIT 1", table];
    
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2(database, [cmd UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        if(sqlite3_step(stmt)){
            char *id = (char*) sqlite3_column_text(stmt, 0);
            
            if(id == NULL) return 0;
            
            int ret =  strtol(id, NULL, 10);
            return ret;
        }
        
        return 0;
    }
    
    NSLog(@"Error reading last ID from database.");
    
    return -1;
}

@end
