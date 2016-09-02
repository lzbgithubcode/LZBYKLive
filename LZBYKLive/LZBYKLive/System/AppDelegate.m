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
#import "YKAppManger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [[YKAppManger shareInstance] yk_application:application didFinishLaunchingWithOptions:launchOptions];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    LZBYKLoginVC *login = [LonginInterfaceDM l_instanceLZBYKLoginVC];
    self.window.rootViewController = [[BaseNC alloc]initWithRootViewController:login];
    [self.window makeKeyAndVisible];
    
    return YES;
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
