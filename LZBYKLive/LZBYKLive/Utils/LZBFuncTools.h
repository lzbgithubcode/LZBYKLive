//
//  LZBFuncTools.h
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>


//适配的尺寸对比
CGFloat getScreenWidth();
CGFloat getScreenHeight();
CGFloat get6sConstantWidth();
CGFloat get6sConstantHeight();
CGFloat get6sConstantWidthScale();
CGFloat get6sConstantHeightScale();

/**
 *  获取随机颜色
 */
UIColor *getRandColor();

/**
 *  获取设置颜色
 */
UIColor *getColor(CGFloat r,CGFloat g,CGFloat b, CGFloat alpha);


#pragma mark - 字符串函数

/**
 *  判断字符串是否包含中文
 *
 */
BOOL isContainChinese(NSString *targetSring);

/**
 *  判断字符串是否可用手机号
 *
 *  @param mobile 手机号
 *
 *  @return 
 */
BOOL isValidateMobile(NSString *mobile);


