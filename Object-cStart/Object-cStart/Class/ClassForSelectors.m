//
//  ClassForSelectors.m
//  Object-cStart
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ClassForSelectors.h"

@implementation ClassForSelectors

-(void) foolNoInput
{
    NSLog(@"Des Nothing");
}

-(void) foolFirstInput:(NSString *)first
{
    NSLog(@"logs %@",first);
}

-(void) foolSecondInput:(NSString*)first SecondInput:(NSString*)second
{
    NSLog(@"Logs %@ then %@", first, second);
}

-(NSArray*) abcWithABC:(NSNumber *)number
{
    int primaryKey=[number intValue];
    NSLog(@"%i",primaryKey);
    return nil;
}

-(void) performMethodsViaSelectors
{
    NSLog(@"in program");
    [self performSelector:@selector(foolNoInput)];
    [self performSelector:@selector(foolFirstInput:) withObject:@"first"];
    [self performSelector:@selector(foolSecondInput:SecondInput:) withObject:@"second" withObject:@"second"];    
}

-(void) performDynamicMethodsViaSelectors
{
    NSArray *Arrays=[NSArray arrayWithObjects:@"AAA",@"BBB", nil];
    for (NSString *array in Arrays)
    {
        SEL customSelector = NSSelectorFromString([NSString stringWithFormat:@"abcWith%@:", array]);
        //[self performSelector:customSelector withObject:0];
        [NSString stringWithFormat:@"abcWith%@:", array];
        //NSLog(@"%s",@selector(customSelector));
    }
}

@end
