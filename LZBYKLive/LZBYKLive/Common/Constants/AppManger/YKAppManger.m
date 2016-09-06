//
//  YKAppManger.m
//  LZBYKLive
//
//  Created by zibin on 16/9/2.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "YKAppManger.h"
#import "LZBYKShareSDKManger.h"
#import "YKAppCacheDataManger.h"
#import "LZBDataConversionManger.h"

#define YKAPPConfigModelKey  @"YKAPPConfigModelKey"

@interface YKAppManger()

@property (nonatomic, strong) YKAPPConfigModel *configModel;

@end

@implementation YKAppManger
- (BOOL)yk_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[LZBYKShareSDKManger shareInstance] ykShareSDK_application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (void)yk_applicationWillResignActive:(UIApplication *)application
{

}

- (void)yk_applicationDidEnterBackground:(UIApplication *)application
{
 
}

- (void)yk_applicationWillEnterForeground:(UIApplication *)application;
{

}

- (void)yk_applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)yk_applicationWillTerminate:(UIApplication *)application
{

}


#pragma mark - app参数
- (YKAPPConfigModel *)getAppConfigModel
{
    //从沙盒中取
    NSDictionary *dict = (NSDictionary *)[[YKAppCacheDataManger shareInstance] getObectForKey:YKAPPConfigModelKey];
    if(dict)
    {
        self.configModel = [[LZBDataConversionManger shareInstance] convertWithDictionary:dict ToModel:[YKAPPConfigModel class]];
    }
    else
    {
    
    }
   if(self.configModel == nil)
   {
       self.configModel = [[YKAPPConfigModel alloc]init];
      
   }
    return self.configModel;
}


@end
