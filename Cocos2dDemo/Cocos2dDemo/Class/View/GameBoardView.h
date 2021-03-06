//
//  MyCocos2DClass.h
//  Cocos2dDemo
//
//  Created by 郑 晋 on 12-10-16.
//  Copyright 2012年 点睛工作室. All rights reserved.
//

#import "cocos2d.h"

#import "GameBoard.h"

@protocol GameBoardViewDelegate

- (void)gameBoard:(GameBoard *)gameBoard touchedAtRow:(int)row column:(int)column;
- (void)gameBoard:(GameBoard *)gameBoard toolboxItemTouchedAtIndex:(int)index;

@end


@interface GameBoardView : CCLayer {
    GameBoard *gameBoard;
}

@property (nonatomic,retain) GameBoard *gameBoard;

-(id)initWithGameBoard:(GameBoard *)aGameBoard;
-(id)initWithGameBoard:(GameBoard *)aGameBoard delegate:(id)aDelegate;

@end