//
//  Player.h
//  sqliteDemo
//
//  Created by 郑 晋 on 12-9-15.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic,copy)NSString *name, *game;
@property (nonatomic,assign) int rating;

@end
