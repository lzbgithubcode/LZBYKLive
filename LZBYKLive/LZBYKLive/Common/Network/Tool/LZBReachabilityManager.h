//
//  LZBReachabilityManager.h
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZBReachabilityManager : NSObject
#pragma mark - 实例化
+ (instancetype)shareInstance;

+ (instancetype)removeInstance;

#pragma mark -网络状态检测

/**
 *  是否打开网络监测
 */
- (void)reachabilityIsOpen:(BOOL)open;
@end
