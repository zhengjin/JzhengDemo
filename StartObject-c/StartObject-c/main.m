//
//  main.m
//  StartObject-c
//
//  Created by 郑 晋 on 12-8-11.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelloWord.h"
#import "ClassForSelectors.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        //id sd=[HelloWord new];
        //[sd issueGreeting];
        HelloWord* myHello=[[HelloWord alloc] init];
        [myHello setGreetingText:@"Hello Object-c"];
        [myHello issueGreeting];
        
        ClassForSelectors* mySelector=[[ClassForSelectors alloc] init];
        [mySelector performMethodsViaSelectors];
        [mySelector performDynamicMethodsViaSelectors];
            
    }
    return 0;
}

