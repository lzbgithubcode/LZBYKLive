//
//  UIView+ClipAngle.h
//  LZBYKLive
//
//  Created by zibin on 16/9/9.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ClipAngle)

/**
 *  裁剪任意方向的任意角度
 *
 *  @param corners     裁剪方向
 *  @param cornerRadii 裁剪角度
 *
 *  @return
 */
- (UIView *)lzb_ClipViewWithRectCornerRegion:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/**
 *  裁剪UIView为圆形
 */
- (UIView *)lzb_ClipViewWithRound;

@end
