//
//  LZBFuncTools.m
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBFuncTools.h"

CGFloat getScreenWidth()
{
    UIScreen *screen = [UIScreen mainScreen];
    return screen.bounds.size.width;
}
CGFloat getScreenHeight()
{
    UIScreen *screen = [UIScreen mainScreen];
    return screen.bounds.size.height;
}
CGFloat get6sConstantWidth()
{
    return 375;
}
CGFloat get6sConstantHeight()
{
    return 667;
}
CGFloat get6sConstantWidthScale()
{
    return getScreenWidth()/get6sConstantWidth();
}
CGFloat get6sConstantHeightScale()
{
    return getScreenHeight()/get6sConstantHeight();
}

UIColor *getRandColor()
{
    return getColor(arc4random()%255, arc4random()%255, arc4random()%255, 255);
}

UIColor *getColor(CGFloat r,CGFloat g,CGFloat b, CGFloat alpha)
{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha/255.0];
}

BOOL isContainChinese(NSString *targetSring)
{
    BOOL result = NO;
    for (NSInteger i = 0; i < targetSring.length; i++)
    {
      unichar  a = [targetSring characterAtIndex:i];
        if(a > 0x4E00 && a < 0x9FA5)
        {
            result = YES;
            break;
        }
    }
    return result;
}

BOOL isValidateMobile(NSString *mobile)
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(10[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

