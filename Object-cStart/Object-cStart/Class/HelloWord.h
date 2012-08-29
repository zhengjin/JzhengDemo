//
//  HelloWord.h
//  Object-cStart
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelloWord : NSObject
{
    NSString *greetingText;
}

-(NSString*) greetingText;
-(void) setGreetingText:(NSString*) newText;
-(void) issueGreeting;

- (void)abcWithAAA: (NSNumber *)number;
@end
