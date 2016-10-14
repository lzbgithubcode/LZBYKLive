//
//  UIButton+ImageTitleSpace.m
//  LZBYKLive
//
//  Created by zibin on 16/10/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "UIButton+ImageTitleSpace.h"

@implementation UIButton (ImageTitleSpace)
- (void)setCustomButtonStyle:(LZBCustomButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space
{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case LZBCustomButtonEdgeInsetsStyle_VerticalImageTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space*0.5, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight-space*0.5, 0);
        }
            break;
        case LZBCustomButtonEdgeInsetsStyle_HorizontalImageLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space*0.5, 0, space*0.5);
            labelEdgeInsets = UIEdgeInsetsMake(0, space*0.5, 0, space*0.5);
        }
            break;
        case LZBCustomButtonEdgeInsetsStyle_VerticalImageBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space*0.5, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space*0.5, -imageWidth, 0, 0);
        }
            break;
        case LZBCustomButtonEdgeInsetsStyle_HorizontalImageRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space*0.5, 0, -labelWidth-space*0.5);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth-space*0.5, 0, imageWidth+space*0.5);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
@end
