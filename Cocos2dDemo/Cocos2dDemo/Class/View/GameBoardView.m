//
//  MyCocos2DClass.m
//  Cocos2dDemo
//
//  Created by 郑 晋 on 12-10-16.
//  Copyright 2012年 点睛工作室. All rights reserved.
//

#import "GameBoardView.h"


@implementation GameBoardView

-(id) init{
    if((self=[self init]))
    {
        //创建初始化显示层
        CCLabelTTF *label=[CCLabelTTF labelWithString:@"hello word from view" fontName:@"marker felt" fontSize:48];
        
        //获取屏幕尺寸
        CGSize size=[[CCDirector sharedDirector] winSize];
        
        //获取屏幕中点
        label.position=ccp(size.width/2, size.height/2);
        
        [self addChild:label];
    }
    return self;
}

@end
