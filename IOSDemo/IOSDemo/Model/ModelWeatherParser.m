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
    
    NSStringEncoding chineseEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
	NSString *ipAddressInfo = 
        [NSString stringWithContentsOfURL:[NSURL URLWithString:ipWebServiceURLStr] encoding:chineseEncoding error:&error];
	NSLog(@"location info: %@", ipAddressInfo);
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"您的IP地址是：+:[^\\s]*" options:0 error:&error];
    if (regex != nil) {
        NSTextCheckingResult *firstMatch = 
            [regex firstMatchInString:ipAddressInfo options:0 range:NSMakeRange(0, [ipAddressInfo length])];
        
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            //从urlString中截取数据
            NSString *result = [ipAddressInfo substringWithRange:resultRange];
            NSLog(@"expression result: %@",result);
        }
    }

    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:weatherServiceURLStr]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"字典里面的内容为-->%@", weatherDic );
}

@end
