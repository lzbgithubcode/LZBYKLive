//
//  AppDelegate.m
//  LZBYKLive
//
//  Created by apple on 16/8/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNC.h"
#import "LonginInterfaceDM.h"
#import "LZBYKMainInterfaceDM.h"
#import "YKAppManger.h"
#import "LZBReachabilityManager.h"
#import "LZBYKLoginManger.h"





@interface AppDelegate ()<LZBYKLoginMangerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [[YKAppManger shareInstance] yk_application:application didFinishLaunchingWithOptions:launchOptions];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self launchPrepare];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)launchPrepare
{
    
    //版本更新
    if([[YKAppManger shareInstance] getAppConfigModel].appNewVersion)
    {
        self.window.rootViewController = [[BaseNC alloc]initWithRootViewController:[LonginInterfaceDM l_instanceLZBYKAdvertisementVC]];
    }
    else
    {
        LZBYKLoginVC *login = [LonginInterfaceDM l_instanceLZBYKLoginVC];
        self.window.rootViewController = [[BaseNC alloc]initWithRootViewController:login];
    }
    //网络监测
    [[LZBReachabilityManager shareInstance] reachabilityIsOpen:YES];
    
    //登陆代理
    [[LZBYKLoginManger shareInstance] addDelegateObject:self];
}


#pragma mark - 登陆方法
- (void)didLogInSucess
{
    [HUD showSuccessMessage:@"登陆成功"];
    LZBWeakSelf(weakSelf);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.window.rootViewController = [LZBYKMainInterfaceDM instanceMainTabVC];
    });
}

- (void)didLogOutSucess
{
  
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[YKAppManger shareInstance] yk_applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[YKAppManger shareInstance] yk_applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[YKAppManger shareInstance] yk_applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[YKAppManger shareInstance]yk_applicationDidBecomeActive: application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
   [[YKAppManger shareInstance] yk_applicationWillTerminate:application];
}

@end
