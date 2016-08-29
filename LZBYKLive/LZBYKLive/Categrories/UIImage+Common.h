//
//  UIImage+Common.h
//  LZBYKLive
//
//  Created by zibin on 16/8/29.
//  Copyright © 2016年 刘子彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

/**
 *  填充颜色作为纯色图片
 *
 *  @param aColor  填充颜色
 */
+ (UIImage *)lzb_imageWithColor:(UIColor *)aColor;

/**
 *  填充颜色作为纯色图片,设置尺寸
 *
 *  @param aColor 填充颜色
 *  @param aFrame 尺寸
 */
+ (UIImage *)lzb_imageWithColor:(UIColor *)aColor WithFrame:(CGRect)aFrame;


/**
 *  图片尺寸缩放
 *
 *  @param originalImage 原始图片，需要缩放的图片
 *  @param targetSize    放大到什么尺寸Size
 */
+ (UIImage *)lzb_imageWithOriginalImage:(UIImage *)originalImage  ScaleToSize:(CGSize)targetSize;

@end


@interface UIImage (LZBClipCircleImage)

- (UIImage *)lzb_ClipCircleImageWithSize:(CGSize)targetSize;

@end
