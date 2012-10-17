//
//  MyCocos2DClass.m
//  Cocos2dDemo
//
//  Created by 郑 晋 on 12-10-17.
//  Copyright 2012年 点睛工作室. All rights reserved.
//

#import "GameBoardController.h"


@implementation GameBoardController

-(id) init
{
    if(self=[super init])
    {
        view=[GameBoardView node];
        
        [self addChild:view];
    }
    return  self;
}

@end
