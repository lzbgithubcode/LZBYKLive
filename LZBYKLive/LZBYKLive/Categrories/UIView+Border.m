//
//  UIView+Border.m
//  LZBYKLive
//
//  Created by zibin on 16/8/29.
//  Copyright © 2016年 刘子彬. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)
- (void)addBottomBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight
{
    CALayer *borderLayer = [CALayer layer];
    borderLayer.backgroundColor = borderColor.CGColor;
    borderLayer.frame = CGRectMake(0, self.frame.size.height-borderHeight , self.frame.size.width, borderHeight);
    [self.layer addSublayer:borderLayer];
}

- (void)addTopBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight
{
    CALayer *borderLayer = [CALayer layer];
    borderLayer.backgroundColor = borderColor.CGColor;
    borderLayer.frame = CGRectMake(0, 0, self.frame.size.width, borderHeight);
    [self.layer addSublayer:borderLayer];
}
- (void)addLeftBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth
{
    CALayer *borderLayer = [CALayer layer];
    borderLayer.backgroundColor = borderColor.CGColor;
    borderLayer.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:borderLayer];
}
- (void)addRightBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth
{
    CALayer *borderLayer = [CALayer layer];
    borderLayer.backgroundColor = borderColor.CGColor;
    borderLayer.frame = CGRectMake(0, self.frame.size.width - borderWidth, borderWidth, self.frame.size.height);
    [self.layer addSublayer:borderLayer];
}

- (void)addTopAndBottomBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight
{
    [self addTopBorderWithBorderColor:borderColor WithHeight:borderHeight];
    [self addBottomBorderWithBorderColor:borderColor WithHeight:borderHeight];
}

- (void)addLeftAndRightBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth
{
    [self addLeftBorderWithBorderColor:borderColor WithWidth:borderWidth];
    [self addRightBorderWithBorderColor:borderColor WithWidth:borderWidth];
}

- (void)addAllBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth
{
    [self addTopBorderWithBorderColor:borderColor WithHeight:borderWidth];
    [self addBottomBorderWithBorderColor:borderColor WithHeight:borderWidth];
    [self addLeftBorderWithBorderColor:borderColor WithWidth:borderWidth];
    [self addRightBorderWithBorderColor:borderColor WithWidth:borderWidth];
}
@end
