//
//  ControllerMoving.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-23.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ControllerMoving.h"
#import "ModelText.h"

@implementation ControllerMoving

-(void)modelDidChange:(ModelText *)model {
	[super modelDidChange:model];
	[self runAction:[CCEaseExponentialOut actionWithAction:
                     [CCMoveBy actionWithDuration: 1.0 position: 
                      ccp(CCRANDOM_MINUS1_1()*20, CCRANDOM_MINUS1_1()*20)]]];
}

@end
