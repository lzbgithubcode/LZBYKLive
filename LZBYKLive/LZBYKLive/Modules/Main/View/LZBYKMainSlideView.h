//
//  LZBYKMainSlideView.h
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBYKSlideStyleModel.h"


typedef NS_ENUM(NSInteger,LZBYKMainSlideViewType)
{
     LZBYKMainSlideViewType_Attention,
     LZBYKMainSlideViewType_Hot,
     LZBYKMainSlideViewType_Near,
};

typedef void(^clickSelectHanleBlcok)(LZBYKMainSlideViewType type);
@interface LZBYKMainSlideView : UIView

- (instancetype)initWithSlideStyleModel:(LZBYKSlideStyleModel *)model selectHandle:(clickSelectHanleBlcok)selectHandle;


- (void)reloadSegmentViewUIWithProgress:(CGFloat)progress  currentIndex:(NSInteger)currentIndex oldIndex:(NSInteger)oldIndex;

@end
