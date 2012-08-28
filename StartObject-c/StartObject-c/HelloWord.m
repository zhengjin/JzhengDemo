//
//  HelloWord.m
//  StartObject-c
//
//  Created by 郑 晋 on 12-8-11.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "HelloWord.h"

@implementation HelloWord

-(NSString*)greetingText
{
    return greetingText;
}

-(void) setGreetingText:(NSString *)newText
{
    greetingText=newText;
}

-(void) issueGreeting
{
    NSLog(@"%@",[self greetingText]);
}

- (void)abcWithAAA: (NSNumber *)number 
{
    NSLog(@"%@", number);
}

@end
