//
//  MyCocos2DClass.h
//  Cocos2dDemo
//
//  Created by 郑 晋 on 12-10-17.
//  Copyright 2012年 点睛工作室. All rights reserved.
//

#import "cocos2d.h"
#import "GameBoardView.h"

@interface GameBoardController : CCNode<GameBoardViewDelegate> {
    GameBoardView *view;
}

@end
