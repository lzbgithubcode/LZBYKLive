//
//  LZBCenterChooseView.h
//  LZBYKLive
//
//  Created by zibin on 16/10/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LZBCenterChooseViewType)
{
    LZBCenterChooseViewType_ShortVideo, //短视频
    LZBCenterChooseViewType_Live,  //直播
};

typedef void(^LZBCenterChooseViewBlock)(LZBCenterChooseViewType type);

@interface LZBCenterChooseView : UIView

@property(nonatomic, copy) LZBCenterChooseViewBlock chooseTypeBlock;

- (void)setChooseTypeBlock:(LZBCenterChooseViewBlock)chooseTypeBlock;

+ (LZBCenterChooseView *)showInSuperView:(UIView *)superView;

+ (LZBCenterChooseView *)show;


@end
