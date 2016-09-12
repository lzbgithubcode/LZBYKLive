//
//  UIView+ClipAngle.m
//  LZBYKLive
//
//  Created by zibin on 16/9/9.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "UIView+ClipAngle.h"


@implementation UIView (ClipAngle)
- (UIView *)lzb_ClipViewWithRectCornerRegion:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    if([self.layer.mask isKindOfClass:[CAShapeLayer class]])
        return self;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = self.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
    
    return self;
}

- (UIView *)lzb_ClipViewWithRound
{
    return [self lzb_ClipViewWithRectCornerRegion:UIRectCornerAllCorners cornerRadii:self.bounds.size];
}

@end
