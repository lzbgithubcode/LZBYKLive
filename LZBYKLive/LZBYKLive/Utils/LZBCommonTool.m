//
//  LZBCommonTool.m
//  LZBYKLive
//
//  Created by zibin on 16/9/22.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBCommonTool.h"

@implementation LZBCommonTool

#pragma mark - 淡入淡出效果
//图片淡入淡出效果
+(void)animationOptionTransitionCrossDissolve:(UIImageView *)view image:(UIImage *)image
{
    view.image = nil;
    [UIView transitionWithView:view
                      duration:0.25
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        view.image = image;
                    } completion:NULL];
    
}
//view淡入淡出效果
+(void)animationOptionTransitionCrossDissolveView:(UIView *)view
{
    view.alpha = 0.5;
    [UIView transitionWithView:view
                      duration:0.25
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        view.alpha = 1;
                    } completion:NULL];
}

@end
