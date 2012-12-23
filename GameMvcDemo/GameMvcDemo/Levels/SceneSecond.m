//
//  SceneSecond.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-23.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "SceneSecond.h"
#import "ControllerText.h"
#import "ModelText.h"

@implementation SceneSecond

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SceneSecond *layer = [SceneSecond node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if (self=[super init]) {
		ControllerText *testController = [[ControllerText new] autorelease];
		ModelText *testModel = (ModelText *)testController.model;
		testModel.title = @"Second Scene!";
		testModel.color = ccc3(63, 63, 255);
		testController.node.position = ccp(200, 200);
		[self addChild:testController.node];
	}
	return self;
}

@end
