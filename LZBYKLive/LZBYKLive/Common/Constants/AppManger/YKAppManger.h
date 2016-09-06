//
//  YKAppManger.h
//  LZBYKLive
//
//  Created by zibin on 16/9/2.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseDataManger.h"
#import "YKAPPConfigModel.h"

@interface YKAppManger : BaseDataManger

- (BOOL)yk_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)yk_applicationWillResignActive:(UIApplication *)application;

- (void)yk_applicationDidEnterBackground:(UIApplication *)application;

- (void)yk_applicationWillEnterForeground:(UIApplication *)application;

- (void)yk_applicationDidBecomeActive:(UIApplication *)application;

- (void)yk_applicationWillTerminate:(UIApplication *)application;



- (YKAPPConfigModel *)getAppConfigModel;
@end
