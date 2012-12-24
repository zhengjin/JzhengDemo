//
//  ControllerText.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-22.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ControllerText.h"

#import "ModelText.h"
#import "ViewText.h"

#import "SceneFirst.h"
#import "SceneSecond.h"

#import "ControllerMoving.h"

@implementation ControllerText

-(id) init {
	if (self=[super init]) {
		self.model = [[ModelText new] autorelease];
		self.node = [[ViewText new] autorelease];
	}
	return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	static int x = 1;
	static BOOL isFirstSceneRunning = YES;
    
	// 出发点击
	if ([self.node isTouchInRect:touch]) {
		// 每十次触发另一个场景.
		if (x%10 == 0) {
			if (isFirstSceneRunning) {
				[[CCDirector sharedDirector] replaceScene:[SceneSecond scene]];
			}
			else {
				[[CCDirector sharedDirector] replaceScene:[SceneFirst scene]];
			}
			isFirstSceneRunning = !isFirstSceneRunning;
		}
        
		// 每四次触发运动
		if (x%4 == 0) {
			ViewText *newNode;
			
			if (x%8 == 0) {
				newNode = [[ViewText new] autorelease];
			}
			else {
				newNode = [[ControllerMoving new] autorelease];
			}
			newNode.position = self.node.position;
			self.node = newNode;
		}
		
		// 每三次触发不同颜色模式
		if (x%3 == 0) {
			ModelText *newModel = [[ModelText new] autorelease];
			if (x%6 == 0) {
				newModel.color = ccGREEN;
			}
			else {
				newModel.color = ccRED;
				newModel.title = @"OMG New Model!";
			}
			self.model = newModel;
		}
		else {	// if x%3 == 1 or == 2, then just display x.
			ModelText *testModel = (ModelText *)self.model;
			testModel.title = [NSString stringWithFormat:@"%d", x];
		}
		x++;
	}
	return YES;
}

@end
