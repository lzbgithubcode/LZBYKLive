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
    LZBWeakSelf(weakSelf);
    LZBYKMainTabVC *rootVC =[LZBYKMainInterfaceDM instanceMainTabVC];
    [UIView transitionFromView:weakSelf.window.rootViewController.view
                        toView:rootVC.view
                      duration:0.3
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    completion:^(BOOL finished) {
                         [HUD showSuccessMessage:@"登陆成功"];
                          weakSelf.window.rootViewController = rootVC;
                    }];
 
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
