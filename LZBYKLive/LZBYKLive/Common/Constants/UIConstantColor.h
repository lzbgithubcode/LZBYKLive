//
//  UIConstantColor.h
//  LZBYKLive
//
//  Created by zibin on 16/9/7.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIConstantColor : NSObject

/**
 *  设置颜色为C1 0x333333 不透明
 */
+ (UIColor *)getWordColorC1;
/**
 *  设置颜色为C2 0x666666 不透明
 */
+ (UIColor *)getWordColorC2;
/**
 *  设置颜色为C3 0x999999 不透明
 */
+ (UIColor *)getWordColorC3;
/**
 *  设置颜色为C4 0xcccccc 不透明
 */
+ (UIColor *)getWordColorC4;
/**
 *  设置颜色为C4 0xffffff 不透明
 */
+ (UIColor *)getWordColorC5;


#pragma mark - 其他
/**
 *  设置背景天蓝色
 */
+ (UIColor *)getLonginBackColor;

/**
 *  设置主题绿色
 */
+ (UIColor *)getThemeColor;

/**
 *  默认导航条背景蓝色
 */
+ (UIColor *)getNaviBlueColor;

/**
 *  设置默认分割线颜色
 */
+ (UIColor *)getDefaultSeperatorColor;
@end
