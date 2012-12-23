//
//  ViewText.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-23.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ViewText.h"
#import "ModelText.h"

@implementation ViewText

-(id) init {
	if (self=[super initWithString:@"" fontName:@"Marker Felt" fontSize:32]) {
		self.anchorPoint = ccp(0.5, 0.5);
		self.position = ccp(320/2, 480/2);
	}
	return self;
}

-(void)modelDidChange:(ModelText *)model {
	[self setString:model.title];
	[self setColor:model.color];
	NSLog(@"%@ %d %d %d", model.title, model.color.r, model.color.g, model.color.b);
}

@end
