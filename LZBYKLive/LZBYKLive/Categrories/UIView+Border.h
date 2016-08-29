//
//  UIView+Border.h
//  LZBYKLive
//
//  Created by zibin on 16/8/29.
//  Copyright © 2016年 刘子彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

- (void)addBottomBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight;

- (void)addTopBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight;

- (void)addLeftBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;

- (void)addRightBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;

- (void)addTopAndBottomBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight;

- (void)addLeftAndRightBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;

- (void)addAllBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;
@end
