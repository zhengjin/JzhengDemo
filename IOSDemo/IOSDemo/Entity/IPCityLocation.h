//
//  IPCityLocation.h
//  IOSDemo
//
//  Created by 郑 晋 on 13-2-20.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPCityLocation : NSObject{
	NSString *ipAddressStr;
	
	NSString *cityFullName;
	NSString *citySimpleName;		//获取天气的城市名称不用加后缀"市"
	
	NSString *serviceUrlStr;
	BOOL	 didGetLocation;
}

@property(nonatomic, copy) NSString *ipAddressStr;
@property(nonatomic, copy) NSString *cityFullName;
@property(nonatomic, copy) NSString *citySimpleName;

@property(nonatomic, copy) NSString *serviceUrlStr;

- (id)initWithUrlStr:(NSString*)urlStr;

@end
