//
//  UIImage+Common.m
//  LZBYKLive
//
//  Created by zibin on 16/8/29.
//  Copyright © 2016年 刘子彬. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)
+ (UIImage *)lzb_imageWithColor:(UIColor *)aColor
{
   return [self lzb_imageWithColor:aColor WithFrame:CGRectMake(0, 0, 1, 1)];
}

+ (UIImage *)lzb_imageWithColor:(UIColor *)aColor WithFrame:(CGRect)aFrame
{
    UIGraphicsBeginImageContext(aFrame.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextFillRect(context, aFrame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)lzb_imageWithOriginalImage:(UIImage *)originalImage  ScaleToSize:(CGSize)targetSize;
{
    CGSize originalSize = originalImage.size;
    CGFloat scale = 0;
    UIImage *newImage = nil;
    if(CGSizeEqualToSize(originalSize, targetSize) == NO)
    {
        CGFloat widthScale = targetSize.width/originalSize.width;
        CGFloat heightScale = targetSize.height/originalSize.height;
        scale =widthScale < heightScale? heightScale:widthScale;
    }
    else
        scale = 1.0;
    CGFloat targetWidth = originalSize.width * scale;
    CGFloat targetHeight = originalSize.height *scale;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [originalImage drawInRect:CGRectMake(0, 0, ceilf(targetWidth), ceilf(targetHeight))];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    NSAssert(newImage, @"newImage = nil 缩放图片失败");
    if(newImage == nil)
        newImage = originalImage;
    UIGraphicsEndImageContext();
    return newImage;
}
@end


@implementation UIImage (LZBClipCircleImage)

- (UIImage *)lzb_ClipCircleImageWithSize:(CGSize)targetSize
{
    UIGraphicsBeginImageContext(targetSize);
    UIImage *newImage = nil;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, targetSize.width, targetSize.height);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [self drawInRect:rect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)lzb_ClipCircleImage
{
    return [self lzb_ClipCircleImageWithSize:self.size];
}

- (UIImage *)lzb_ClipCircleImageWithName:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] lzb_ClipCircleImage];
}

@end
