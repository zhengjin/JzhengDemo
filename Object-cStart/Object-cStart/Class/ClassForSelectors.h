//
//  ClassForSelectors.h
//  Object-cStart
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassForSelectors : NSObject

-(void) foolNoInput;
-(void) foolFirstInput:(NSString*) first;
-(void) foolSecondInput:(NSString*)first SecondInput:(NSString*)second;

-(NSArray*) abcWithABC:(NSNumber*) number;

-(void) performMethodsViaSelectors;
-(void) performDynamicMethodsViaSelectors;

@end
