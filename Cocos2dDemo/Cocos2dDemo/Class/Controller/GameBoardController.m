//
//  MyCocos2DClass.m
//  Cocos2dDemo
//
//  Created by 郑 晋 on 12-10-17.
//  Copyright 2012年 点睛工作室. All rights reserved.
//

#import "GameBoardController.h"

#import "GameBoardView.h"
#import "GameBoard.h"

@implementation GameBoardController

-(id) init
{
    if ((self = [super init])) {
        // initialize model
        
        GameBoard *gameBoard = [[GameBoard alloc] initWithRows:7 columns:9];
        
        // initialize view
        view = [[GameBoardView alloc] initWithGameBoard:gameBoard];
        
        [self addChild:view];
    }
    
    return  self;
}

- (void)gameBoard:(GameBoard *)gameBoard touchedAtRow:(int)row column:(int)column
{
    
}

- (void)gameBoard:(GameBoard *)gameBoard toolboxItemTouchedAtIndex:(int)index
{

}

@end
