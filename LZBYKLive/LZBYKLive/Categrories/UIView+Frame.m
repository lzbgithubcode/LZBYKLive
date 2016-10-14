//
//  UIView+Frame.m
//  LZBYKLive
//
//  Created by zibin on 16/8/29.
//  Copyright © 2016年 刘子彬. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (void)setLzb_x:(CGFloat)lzb_x
{
    CGRect frame = self.frame;
    frame.origin.x = lzb_x;
    self.frame = frame;
}
- (CGFloat)lzb_x
{
    return self.frame.origin.x;
}

- (void)setLzb_y:(CGFloat)lzb_y
{
    CGRect frame = self.frame;
    frame.origin.y = lzb_y;
    self.frame = frame;
}

- (CGFloat)lzb_y
{
  return self.frame.origin.y;
}

- (void)setLzb_w:(CGFloat)lzb_w
{
    CGRect frame = self.frame;
    frame.size.width = lzb_w;
    self.frame = frame;
}

- (CGFloat)lzb_w
{
   return self.frame.size.width;
}

- (void)setLzb_h:(CGFloat)lzb_h
{
    CGRect frame = self.frame;
    frame.size.height = lzb_h;
    self.frame = frame;
}

- (CGFloat)lzb_h
{
  return self.frame.size.height;
}

- (void)setLzb_Size:(CGSize)lzb_Size
{
    CGRect frame = self.frame;
    frame.size = lzb_Size;
    self.frame = frame;
}

- (CGSize)lzb_Size
{
    return self.frame.size;
}

- (void)setLzb_Origin:(CGPoint)lzb_Origin
{
    CGRect frame = self.frame;
    frame.origin = lzb_Origin;
    self.frame = frame;
}

- (CGPoint)lzb_Origin
{
    return self.frame.origin;
}

- (void)setLzb_Center:(CGPoint)lzb_Center
{
    CGPoint centerVaule = self.center;
    centerVaule = lzb_Center;
    self.center = centerVaule;
}

- (CGPoint)lzb_Center
{
    return self.center;
}

- (void)setLzb_CenterX:(CGFloat)lzb_CenterX
{
    CGPoint center = self.center;
    center.x = lzb_CenterX;
    self.center = center;
}

- (CGFloat)lzb_CenterX
{
    return self.center.x;
}

- (void)setLzb_CenterY:(CGFloat)lzb_CenterY
{
    CGPoint center = self.center;
    center.y = lzb_CenterY;
    self.center = center;
}

- (CGFloat)lzb_CenterY
{
  return self.center.y;
}

- (void)removeAllSubviews
{
    while (self.subviews.count)
    {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

@end
