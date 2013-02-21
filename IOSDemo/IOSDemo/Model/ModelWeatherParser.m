//
//  ModelWeatherParser.m
//  IOSDemo
//
//  Created by 郑 晋 on 13-2-21.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import "ModelWeatherParser.h"

#define ipWebServiceURLStr @"http://www.ip138.com/ips138.asp"
#define kWeatherServiceURLStr @"http://webservice.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName="

@implementation ModelWeatherParser

@synthesize ipCityLocation;
@synthesize parseSuccssful;
@synthesize dayWeatherArray;

-(void)startParse{
    
}

@end
