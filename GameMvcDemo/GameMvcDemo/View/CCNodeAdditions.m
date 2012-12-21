//
//  CCNodeAdditions.m
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-21.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "CCNodeAdditions.h"

@implementation CCNode (Additions)

@dynamic rect, center;

-(CGRect) rect
{
	return CGRectMake( self.position.x - contentSize_.width*anchorPoint_.x, self.position.y-
					  contentSize_.height*anchorPoint_.y,
					  contentSize_.width, contentSize_.height);
}

-(CGPoint) center {
	float x = self.rect.origin.x + self.rect.size.width/2;
	float y = self.rect.origin.y + self.rect.size.height/2;
	return ccp(x,y);
}

-(BOOL)isTouchInRect:(UITouch *)touch {
	CGPoint touchLocation = [touch locationInView: [touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
	CGPoint local = [self convertToNodeSpace:touchLocation];
	CGRect r = self.rect;
	r.origin = CGPointZero;
	if( CGRectContainsPoint( r, local ) ) {
		return YES;
	}
	else {
		return NO;
	}
}

@end

