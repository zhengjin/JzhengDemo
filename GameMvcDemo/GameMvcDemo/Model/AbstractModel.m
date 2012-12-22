//
//  AbstractModel.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-21.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "AbstractModel.h"

@implementation AbstractModel

-(id)init {
	if (self=[super init]) {
		delegates = [NSMutableSet new];
	}
	return self;
}

-(void)didChange {
	for (id<ModelDelegate>delegate in delegates) {
		[delegate modelDidChange:self];
	}
}

-(void)addDelegate:(id<ModelDelegate>)delegate {
	[delegates addObject:delegate];
	[delegate modelDidChange:self];	// update the delegate with the newest model information
}

-(void)removeDelegate:(id<ModelDelegate>)delegate {
	[delegates removeObject:delegate];
}

-(void)dealloc {
	[delegates release];
    
	[super dealloc];
}

@end
