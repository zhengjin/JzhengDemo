//
//  ModelText.h
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-22.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "AbstractModel.h"
#import "cocos2d.h"
#import <Foundation/Foundation.h>

@interface ModelText : AbstractModel
{
    NSString *title;
	ccColor3B color;
}

@property (nonatomic) ccColor3B color;
@property (nonatomic, retain) NSString *title;

-(id) initWithTitle:(NSString *)aTitle color:(ccColor3B)aColor;

@end
