//
//  AppConstants.m
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "AppConstants.h"

@implementation AppConstants
+ (NSString *)getShareSDKAppkey
{
  return @"16b9edacc91bb";
}

+ (NSString *)getShareSDKAppSecret
{
  return @"92f2cfd96982bb9c2d276f73c37c78de";
}


+ (NSString *)getCurrentVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
@end
