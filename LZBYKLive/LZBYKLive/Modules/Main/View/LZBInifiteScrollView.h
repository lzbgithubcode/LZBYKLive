//
//  LZBInifiteScrollView.h
//  三个ImageView的轮播图
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）.
//

#import <UIKit/UIKit.h>

@class LZBInifiteScrollView;

@protocol LZBInifiteScrollViewDelegate <NSObject>

@optional
- (void)lzbInifiteScrollView:(LZBInifiteScrollView *)foucsScrollView didSelectScrollViewIndex:(NSInteger)index;

@end


typedef NS_ENUM(NSInteger,LZBFocusScrollViewPageControllPosition){
    LZBFocusScrollViewPageControllPosition_None,    //默认底部中心
    LZBFocusScrollViewPageControllPosition_Hidden,   //隐藏
    LZBFocusScrollViewPageControllPosition_BottomCenter,  //底部中心
    
};



@interface LZBInifiteScrollView : UIView

/**
 *  设置占位图片
 */
@property (nonatomic, strong) UIImage *placeholder;

/**
 *  图片数据(里面可以存放UIImage对象、NSString对象【本地图片名】、NSURL对象【远程图片的URL】)
 */
@property (nonatomic, strong) NSArray *images;

/**
 *  定时时间.默认是2s
 */
@property (nonatomic ,assign) NSTimeInterval interValTime;

/**
 *  轮播焦点图代理
 */
@property (nonatomic, weak) id <LZBInifiteScrollViewDelegate> foucsDelegate;

#pragma mark - 指示器方法
/**
 *  设置指示器位置
 */
@property (nonatomic,assign) LZBFocusScrollViewPageControllPosition pageControlPosition;

/**
 *  自定义设置分页指示器的图片
 *
 *  @param currentImage 选择图片
 *  @param otherImage   其他图片
 */
- (void)setPageControlCurrentImage:(UIImage *)currentImage OtherImage:(UIImage *)otherImage;

/**
 *  自定义设置分页指示器的颜色
 *
 *  @param currentColor 选中得颜色
 *  @param otherColor   其他颜色
 */
- (void)setpageControlCurrentColor:(UIColor *)currentColor OtherColor:(UIColor *)otherColor;

@end
