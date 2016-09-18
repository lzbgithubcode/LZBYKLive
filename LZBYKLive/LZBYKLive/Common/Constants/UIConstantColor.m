//
//  UIConstantColor.m
//  LZBYKLive
//
//  Created by zibin on 16/9/7.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "UIConstantColor.h"

/**颜色转换**/
#define ColorChangeRGB(colorchange,alpa)  [UIColor colorWithRed:(CGFloat)(((colorchange &0xff0000)>>16)/255.0) green:(CGFloat)(((colorchange &0xff00)>> 8)/255.0 )blue:(CGFloat)((colorchange & 0xff)/255.0 ) alpha:alpa]

@implementation UIConstantColor

+ (UIColor *)getWordColorC1
{
    return ColorChangeRGB(0x4a4a4a, 1.0);
}

+ (UIColor *)getWordColorNewC1
{
    return ColorChangeRGB(0x4a4a4a, 1.0);
}

+ (UIColor *)getWordColorC2
{
    return ColorChangeRGB(0x666666, 1.0);
}


+ (UIColor *)getWordColorC3
{
    return ColorChangeRGB(0x999999, 1.0);
}

+ (UIColor *)getWordColorC4
{
    return  ColorChangeRGB(0xcccccc, 1.0);
}
+ (UIColor *)getWordColorC5
{
    return ColorChangeRGB(0xffffff, 1.0);
}


#pragma mark - 其他
+ (UIColor *)getLonginBackColor
{
    return [UIColor colorWithRed:230.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
}

+ (UIColor *)getThemeColor{
    return ColorChangeRGB(0x00bb9e, 1);
}

+ (UIColor *)getNaviBlueColor
{
   return [UIColor colorWithRed:0.0/255.0 green:210.0/255.0 blue:190.0/255.0 alpha:1.0];
}

@end
