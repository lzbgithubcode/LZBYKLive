//
//  UIButton+ImageTitleSpace.h
//  LZBYKLive
//
//  Created by zibin on 16/10/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LZBCustomButtonEdgeInsetsStyle) {
    LZBCustomButtonEdgeInsetsStyle_VerticalImageTop,    // image在上，label在下
    LZBCustomButtonEdgeInsetsStyle_HorizontalImageLeft, // image在左，label在右
    LZBCustomButtonEdgeInsetsStyle_VerticalImageBottom, // image在下，label在上
    LZBCustomButtonEdgeInsetsStyle_HorizontalImageRight // image在右，label在左
};
@interface UIButton (ImageTitleSpace)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)setCustomButtonStyle:(LZBCustomButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;
@end
