//
//  LZBYKDefaultNoDataView.h
//  LZBYKLive
//
//  Created by zibin on 16/9/23.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZBYKDefaultNoDataView : UIView

- (instancetype)initWithFrame:(CGRect)frame WithImage:(UIImage *)defaultImage text:(NSString *)text;

+ (void)showDefaultNoDataViewInView:(UIView *)superView WithImage:(UIImage *)defaultImage text:(NSString *)text;
+ (void)showDefaultNoDataViewInView:(UIView *)superView;
@end
