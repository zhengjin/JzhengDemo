//
//  CCNodeController.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-21.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "CCNodeController.h"

@implementation CCNodeController

@synthesize model, node, swallowsTouches;

+(id)controllerWithNode:(CCNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel {
	return [[self alloc] initWithNode:aNode model:aModel];
}

+(id)controllerWithNode:(CCNode *)aNode {
	return [[self alloc] initWithNode:aNode];
}

+(id)controllerWithModel:(AbstractModel *)aModel {
	return [[self alloc] initWithModel:aModel];
}

-(id)initWithNode:(CCNode<ModelDelegate> *)aNode model:(AbstractModel *)aModel {
	if (self=[self init]) {
		self.node = aNode;
		self.model = aModel;
	}
	return self;
}

-(id)initWithNode:(CCNode *)aNode {
	if (self=[self init]) {
		self.node = aNode;
	}
	return self;
}

-(id)initWithModel:(AbstractModel *)aModel {
	if (self=[self init]) {
		self.model = aModel;
	}
	return self;
}

-(id)init {
	if (self=[super init]) {
		self.swallowsTouches = YES;
	}
	return self;
}

-(void)setModel:(AbstractModel *)theModel {
	if (model) {
		if (node) {
			[model removeDelegate:node];
		}
		[model release];
		model = nil;
	}
	model = [theModel retain];
	
	if (node) {
		[model addDelegate:node];
	}
}

-(void)setNode:(CCNode<ModelDelegate> *)aNode {
	CCNode *parent = nil;
	int zOrder = 0;	// default value
	
	if (node) {
		zOrder = node.zOrder;
		parent = node.parent;
		
		if (model) {
			[model removeDelegate:node];
		}
		if (parent) {
			[parent removeChild:node cleanup:YES];
		}
        
		node.controller = nil;
		[node release];
		node = nil;
	}
	
	node = [aNode retain];
	node.controller = self;
	
	if (model) {
		[model addDelegate:node];
	}
	if (parent) {
		[parent addChild:node z:zOrder];
	}
}

-(void)setSwallowsTouches:(BOOL)doesSwallowTouches {
	swallowsTouches = doesSwallowTouches;
	
	// If we have a Node and the Node is on screen
	if (node && node.isRunning) {
		[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate: self
														 priority: 0
												  swallowsTouches: self.swallowsTouches];
	}
}

- (void)onEnter {
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate: self
													 priority: 0 
											  swallowsTouches: self.swallowsTouches];
}

- (void)onExit {	
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
}

// OVERRIDE
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	return NO;
}

// OVERRIDE
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
}

// OVERRIDE
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
}

// OVERRIDE
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
}

-(void)dealloc {
	[model release];
	[node release];
	
	[super dealloc];
}

@end
