//
//  ModelWeatherParser.h
//  IOSDemo
//
//  Created by 郑 晋 on 13-2-21.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPCityLocation.h"

@interface ModelWeatherParser : NSObject{
	IPCityLocation *ipCityLocation;
	
	NSMutableArray *dayWeatherArray;
	NSArray *weekNameArray;
	
	BOOL parseSuccssful;
}

@property(nonatomic, readonly) IPCityLocation *ipCityLocation;
@property(nonatomic, readonly) BOOL parseSuccssful;
@property(nonatomic, readonly) NSMutableArray *dayWeatherArray;
- (void)startParse;

@end
