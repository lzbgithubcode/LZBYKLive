//
//  AppConstants.h
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConstants : NSObject

/**
 *  获得shareSDK的appkey
 */
+ (NSString *)getShareSDKAppkey;

/**
 *  获得shareSDK的appSecret
 */
+ (NSString *)getShareSDKAppSecret;



#pragma mark - app信息
/**
 *  获得当前app版本号
 */
+ (NSString *)getCurrentVersion;
@end
