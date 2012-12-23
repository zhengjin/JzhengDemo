//
//  SceneFirst.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-23.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "SceneFirst.h"
#import "ControllerText.h"

@implementation SceneFirst

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SceneFirst *layer = [SceneFirst node];
	
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
		[self addChild:testController.node];
	}
	return self;
}	

@end
