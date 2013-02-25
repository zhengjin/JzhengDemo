//
//  ModelWeatherParser.m
//  IOSDemo
//
//  Created by 郑 晋 on 13-2-21.
//  Copyright (c) 2013年 点睛工作室. All rights reserved.
//

#import "ModelWeatherParser.h"

#define ipWebServiceURLStr @"http://www.ip138.com/ips138.asp"
#define weatherServiceURLStr @"http://webservice.webxml.com.cn/WebServices/WeatherWebService.asmx/getWeatherbyCityName?theCityName="

@implementation ModelWeatherParser

@synthesize ipCityLocation;
@synthesize parseSuccssful;
@synthesize dayWeatherArray;

-(void)startParse{
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ipWebServiceURLStr]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"字典里面的内容为-->%@", weatherDic );
}

@end
