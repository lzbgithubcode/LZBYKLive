//
//  LZBYKTabBar.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKTabBar.h"

@interface LZBYKTabBar()

@property (nonatomic, strong) UIButton *centerPlayButton;
@end

@implementation LZBYKTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
   if(self = [super initWithFrame:frame])
   {
     [self addSubview:self.centerPlayButton];
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
    
    CGFloat tabbarItemW = self.lzb_w/3;
    NSInteger tabbarButtonIndex = 0;
    for (UIView *subView in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if([subView isKindOfClass:class])
        {
            subView.lzb_x = tabbarButtonIndex * tabbarItemW;
            subView.lzb_w = tabbarItemW;
            tabbarButtonIndex++;
            if(tabbarButtonIndex == 1)
                tabbarButtonIndex++;
        }
    }
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
      
      
  }
    return _centerPlayButton;
}
@end
