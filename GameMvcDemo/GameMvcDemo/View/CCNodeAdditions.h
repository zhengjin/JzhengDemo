//
//  CCNodeAdditions.h
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-21.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "cocos2d.h"

@interface CCNode (Additions)

@property (nonatomic, readonly) CGRect rect;	// 动态添加边界
@property (nonatomic, readonly) CGPoint center;	// 动态添加中心点

-(BOOL)isTouchInRect:(UITouch *)touch;

@end