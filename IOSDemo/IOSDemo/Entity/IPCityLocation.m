//
//  IPCityLocation.m
//  IOSDemo
//
//  Created by 郑 晋 on 13-2-20.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import "IPCityLocation.h"

@interface IPCityLocation(private)
- (void)parseCityLocation;
@end

@implementation IPCityLocation

@synthesize ipAddressStr;
@synthesize cityFullName;
@synthesize citySimpleName;
@synthesize serviceUrlStr;

#pragma mark init & alloc 
- (id)initWithUrlStr:(NSString*)urlStr{
	self = [super init];
	if (self) {
		didGetLocation = NO;
		self.serviceUrlStr = urlStr;
		
		[self parseCityLocation];
	}
	return self;
}

#pragma mark parse

- (void)parseCityLocation{
    
}

@end
