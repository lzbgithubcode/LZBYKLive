//
//  LZBCommonTool.h
//  LZBYKLive
//
//  Created by zibin on 16/9/22.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZBCommonTool : NSObject
//图片淡入淡出效果
+(void)animationOptionTransitionCrossDissolve:(UIImageView *)view image:(UIImage *)image;
//view淡入淡出效果
+(void)animationOptionTransitionCrossDissolveView:(UIView *)view;
@end
