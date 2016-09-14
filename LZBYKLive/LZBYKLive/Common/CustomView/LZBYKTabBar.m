//
//  LZBYKTabBar.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKTabBar.h"
#import "UIView+ClipAngle.h"

#define tabbar_item_height   36

@interface LZBYKTabBar()

@property (nonatomic, strong) UIButton *centerPlayButton;
@end

@implementation LZBYKTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
   if(self = [super initWithFrame:frame])
   {
     [self addSubview:self.centerPlayButton];
     self.backgroundColor = [UIColor yellowColor];
       //去除tabbar顶部分割线
     [[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];
     [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
   }
    return self;
}



- (void)centerPlayButtonClick
{
   if(self.tabBarCenterClickBlcok)
       self.tabBarCenterClickBlcok();
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.centerPlayButton.lzb_CenterX = self.lzb_w *0.5;
    self.centerPlayButton.lzb_CenterY = self.lzb_h * 0.2;
    [self.centerPlayButton lzb_ClipViewWithRound];
    CGFloat tabbarItemW = self.lzb_w/3;
    NSInteger tabbarButtonIndex = 0;
    for (UIView *subView in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if([subView isKindOfClass:class])
        {
            subView.lzb_w = tabbarItemW;
            subView.lzb_h = LZBSCREEN__TABBAR__HEIGHT;
            subView.lzb_x = tabbarButtonIndex * tabbarItemW;
            subView.lzb_y = (self.lzb_h - tabbar_item_height)* 0.5;
            tabbarButtonIndex++;
            if(tabbarButtonIndex == 1)
               tabbarButtonIndex++;
        }
    }
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if(view == nil || ((point.x >= self.centerPlayButton.lzb_x && point.x <= self.centerPlayButton.lzb_x + self.centerPlayButton.lzb_w) && (point.y >=self.centerPlayButton.lzb_y && point.y <= fabs(self.centerPlayButton.lzb_y) + self.centerPlayButton.lzb_h)))
    {
        if(CGRectContainsPoint(self.centerPlayButton.frame, point))
        view = self.centerPlayButton;
    }
    return view;
}


#pragma mark - set/get
- (UIButton *)centerPlayButton
{
  if(_centerPlayButton == nil)
  {
      _centerPlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [_centerPlayButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
      _centerPlayButton.lzb_Size = _centerPlayButton.currentImage.size;
      [_centerPlayButton addTarget:self action:@selector(centerPlayButtonClick) forControlEvents:UIControlEventTouchUpInside];
      //设置阴影
      _centerPlayButton.layer.shadowColor = [UIConstantColor getLonginBackColor].CGColor;
      _centerPlayButton.layer.shadowRadius =_centerPlayButton.currentImage.size.width * 0.5;
      _centerPlayButton.layer.shadowOffset = CGSizeMake(0, 4);
  }
    return _centerPlayButton;
}
@end
