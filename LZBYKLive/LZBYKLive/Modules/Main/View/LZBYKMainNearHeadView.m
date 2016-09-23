//
//  LZBYKMainNearHeadView.m
//  LZBYKLive
//
//  Created by zibin on 16/9/22.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainNearHeadView.h"

@interface LZBYKMainNearHeadView()

@property (nonatomic, strong) UIButton *nearPlayButton;

@end

@implementation LZBYKMainNearHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
   if(self = [super initWithFrame:frame])
   {
       self.backgroundColor = [UIColor whiteColor];
       [self addSubview:self.nearPlayButton];
   }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nearPlayButton.frame = CGRectMake(10, 10, LZBSCREEN__WIDTH * 0.4 * get6sConstantWidthScale(), 30 *get6sConstantHeightScale());
}

- (UIButton *)nearPlayButton
{
   if(_nearPlayButton == nil)
   {
       _nearPlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
       _nearPlayButton.titleLabel.font = [UIConstantFont getFontW3_H12];
       [_nearPlayButton setTitleColor:[UIConstantColor getWordColorC1] forState:UIControlStateNormal];
       [_nearPlayButton setTitle:@"附近正在直播" forState:UIControlStateNormal];
       [_nearPlayButton setImage:[UIImage imageNamed:@"nearby_icon_now_live"] forState:UIControlStateNormal];
       _nearPlayButton.adjustsImageWhenHighlighted = NO;
       _nearPlayButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
       _nearPlayButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
   }
    return _nearPlayButton;
}
@end
