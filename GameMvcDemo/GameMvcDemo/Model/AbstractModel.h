//
//  AbstractModel.h
//  GameMvcDemo
//
//  Created by 郑 晋 on 12-12-21.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AbstractModel;

@protocol ModelDelegate <NSObject>

@required
-(void)modelDidChange:(AbstractModel *)model;

@end

// private methods for AbstractModel
@protocol AbstractModel <NSObject>

@required
-(void)didChange;	// notifies delegates of change. object is responsible for calling this internally

@end

@interface AbstractModel : NSObject<AbstractModel>
{
   NSMutableSet *delegates; 
}

-(void)addDelegate:(id<ModelDelegate>)delegate;
-(void)removeDelegate:(id<ModelDelegate>)delegate;

@end
