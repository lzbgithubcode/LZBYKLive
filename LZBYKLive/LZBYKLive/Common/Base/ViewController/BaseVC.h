//
//  BaseVC.h
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController

@property (nonatomic, strong) UIView *naviBarContentView;

@property (nonatomic, strong) UIView *baseContentView;

@property (nonatomic, strong) UIButton *baseLeftButton;

@property (nonatomic, strong) UIButton *baseRightButton;

/**
 *  设置状态栏风格
 */
@property (nonatomic, assign) UIStatusBarStyle statusStyle;

/**
 *  是否显示自定义导航条,操作自定义导航条就必须设置yes
 */
@property (nonatomic, assign) BOOL isShowCustomBar;


#pragma mark - method
/**
 *  添加左按钮事件响应
 *
 *  @param selector
 */
- (void)addLeftButtonSelector:(SEL)selector;
/**
 *  添加右按钮事件响应
 *
 *  @param selector
 */
- (void)addRightButtonSelector:(SEL)selector;

/**
 *  设置左按钮图片
 *
 *  @param image
 */
- (void)setLeftButtonImage:(UIImage *)image;
/**
 *  设置右按钮图片
 *
 *  @param image
 */
- (void)setRightButtonImage:(UIImage *)image;
/**
 *  设置左按钮文字
 *
 *  @param title
 */
- (void)setLeftButtonTitle:(NSString *)title;

/**
 *  设置右按钮文字
 *
 *  @param title
 */
- (void)setRightButtonTitle:(NSString *)title;

@end
