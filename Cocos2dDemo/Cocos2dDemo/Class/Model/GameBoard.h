//
//  GameBoard.h
//  Cocos2dDemo
//
//  Created by 郑 晋 on 12-10-17.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameBoard : NSObject
{
    NSInteger numberOfRows;
    NSInteger numberOfColumn;
}

-(id)initWithRows:(NSInteger)aNumberOfRows columns:(NSInteger)aNumberOfColumn;

@property (nonatomic) NSInteger numberOfRows;
@property (nonatomic) NSInteger numberOfColumn;

@end

@protocol GameBoardViewDelegate

-(void)gameBoard:(GameBoard *)gameBoard touchedAtRow:(int)row column:(int)column;

@end
