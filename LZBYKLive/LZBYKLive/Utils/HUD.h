//
//  HUD.h
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HUD : NSObject

/**
 *  显示加载数据
 */
+ (void)showMessage:(NSString *)message;

/**
 *  显示成功数据
 */
+ (void)showSuccessMessage:(NSString *)message;

/**
 *  显示失败数据
 */
+ (void)showFailMessage:(NSString *)message;

/**
 *  取消显示框
 */
+ (void)dismissHUD;
@end
