//
//  ModelText.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-22.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ModelText.h"

@implementation ModelText

@synthesize title, color;

-(id) init {
	return [self initWithTitle:@"Default title" color:ccc3(255, 255, 255)];
}

-(id) initWithTitle:(NSString *)aTitle color:(ccColor3B)aColor {
	if (self=[super init]) {
		title = [aTitle retain];
		self.color = aColor;
	}
	return self;
}

-(void) setTitle:(NSString *)aTitle {
	NSLog(@"set title to %@", aTitle);
	[title release];
	title = [aTitle retain];
	[self didChange];
}

-(void) setColor:(ccColor3B)aColor {
	color = aColor;
	[self didChange];
}

-(void) dealloc {
	[title release];
	
	[super dealloc];
}

@end
