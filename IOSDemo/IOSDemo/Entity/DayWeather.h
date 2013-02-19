//
//  DayWeather.h
//  IOSDemo
//
//  Created by 郑 晋 on 13-2-19.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DayWeather : NSObject{
    NSString *dateStr;			// 日期
	NSString *weekStr;			// 星期
	NSString *temperatureRangeInfo;	// 温度范围
	NSString *windInfo;				// 风向
	NSString *basicInfo;			// 基本信息
	NSString *realtimeInfo;			// 实时信息
	NSString *picureStartName;		// 天气图片开始名称
	NSString *picureEndName;		// 天气图片结束名称
}

@property(nonatomic, copy) NSString *dateStr;
@property(nonatomic, copy) NSString *weekStr;
@property(nonatomic, copy) NSString *temperatureRangeInfo;
@property(nonatomic, copy) NSString *windInfo;
@property(nonatomic, copy) NSString *basicInfo;
@property(nonatomic, copy) NSString *realtimeInfo;
@property(nonatomic, copy) NSString *picureStartName;
@property(nonatomic, copy) NSString *picureEndName;

@end
