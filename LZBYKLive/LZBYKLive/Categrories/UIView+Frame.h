//
//  UIView+Frame.h
//  LZBYKLive
//
//  Created by zibin on 16/8/29.
//  Copyright © 2016年 刘子彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property (nonatomic, assign) CGFloat lzb_x;
@property (nonatomic, assign) CGFloat lzb_y;
@property (nonatomic, assign) CGFloat lzb_w;
@property (nonatomic, assign) CGFloat lzb_h;
@property (nonatomic, assign) CGSize  lzb_Size;
@property (nonatomic, assign) CGPoint lzb_Origin;
@property (nonatomic, assign) CGFloat lzb_CenterX;
@property (nonatomic, assign) CGFloat lzb_CenterY;
@property (nonatomic, assign) CGPoint lzb_Center;

- (void)removeAllSubviews;
@end
