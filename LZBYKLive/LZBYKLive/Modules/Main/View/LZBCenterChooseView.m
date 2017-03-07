//
//  LZBCenterChooseView.m
//  LZBYKLive
//
//  Created by zibin on 16/10/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBCenterChooseView.h"
#import "UIButton+ImageTitleSpace.h"

#define cancleButton_Width_Height 50
#define liveButton_Width_Height 75

#define DAFAULT_TAG  100
@interface LZBCenterChooseView()
@property (nonatomic,strong) UIView *containView;
@property (nonatomic,strong) UIButton *cancleButton;
@property (nonatomic,strong) UIButton *shortVideoButton;
@property (nonatomic,strong) UIButton *liveButton;
@end

@implementation LZBCenterChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
  if(self = [super initWithFrame:frame])
  {
      self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
      [self addSubview:self.containView];
      [self.containView addSubview:self.liveButton];
      [self.containView addSubview:self.shortVideoButton];
      [self.containView addSubview:self.cancleButton];
      [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleChooseView)]];
  }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.containView.frame = CGRectMake(0, LZBSCREEN__HEIGHT, LZBSCREEN__WIDTH, 200);
    self.liveButton.frame = CGRectMake(0, 0, LZBSCREEN__WIDTH * 0.5, self.containView.lzb_h-cancleButton_Width_Height);
    self.shortVideoButton.frame = CGRectMake(CGRectGetMaxX(self.liveButton.frame), 0, self.liveButton.lzb_w, self.liveButton.lzb_h);
    self.cancleButton.frame = CGRectMake(0, CGRectGetMaxY(self.liveButton.frame ), LZBSCREEN__WIDTH, cancleButton_Width_Height);
    [self.shortVideoButton setCustomButtonStyle:LZBCustomButtonEdgeInsetsStyle_VerticalImageTop imageTitleSpace:0];
    [self.liveButton setCustomButtonStyle:LZBCustomButtonEdgeInsetsStyle_VerticalImageTop imageTitleSpace:0];
    [self addAnimationWithView:self.liveButton];
    [self addAnimationWithView:self.shortVideoButton];
}

- (void)cancleChooseView
{
    LZBWeakSelf(weakSelf);
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.containView.lzb_y = getScreenHeight();
        weakSelf.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    } completion:^(BOOL finished) {
        [weakSelf removeAllSubviews];
        [weakSelf removeFromSuperview];
    }];
}



#pragma mark - 外界调用
+ (LZBCenterChooseView *)showInSuperView:(UIView *)superView
{
    if(superView == nil)
        superView = [UIApplication sharedApplication].keyWindow;
    
    LZBCenterChooseView *chooseView = [[self alloc]init];
    [superView addSubview:chooseView];
    chooseView.frame = [UIScreen mainScreen].bounds;
    chooseView.alpha = 0.0;
    [UIView animateWithDuration:0.1 animations:^{
       chooseView.alpha = 1.0;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            chooseView.containView.lzb_y = LZBSCREEN__HEIGHT - chooseView.containView.lzb_h;
        }];
    }];
    return chooseView;

}

+ (LZBCenterChooseView *)show
{
   return [self showInSuperView:nil];
}

- (void)chooseViewClick:(UIButton *)btn
{
   if(self.chooseTypeBlock)
   {
       self.chooseTypeBlock(btn.tag == DAFAULT_TAG?LZBCenterChooseViewType_Live:LZBCenterChooseViewType_ShortVideo);
       [self cancleChooseView];
   }
}

- (void)addAnimationWithView:(UIView *)animationView
{
    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"position.y"];
    springAnimation.damping = 10;
    springAnimation.stiffness = 100;
    springAnimation.mass = 2;
    springAnimation.initialVelocity = 50;
    springAnimation.fromValue = @(animationView.layer.position.y-5);
    springAnimation.toValue = @(animationView.layer.position.y);
    springAnimation.duration = springAnimation.settlingDuration;
    [animationView.layer addAnimation:springAnimation forKey:@"springAnimation"];
}

#pragma mark- 懒加载
- (UIView *)containView
{
  if(_containView == nil)
  {
      _containView = [UIView new];
      _containView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
  }
    return _containView;
}

- (UIButton *)cancleButton
{
  if(_cancleButton == nil)
  {
      _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [_cancleButton setImage:[UIImage imageNamed:@"shortvideo_launch_close"] forState:UIControlStateNormal];
      _cancleButton.backgroundColor = [UIColor whiteColor];
      [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
      [_cancleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
      [_cancleButton addTarget:self action:@selector(cancleChooseView) forControlEvents:UIControlEventTouchUpInside];
  }
    return _cancleButton;
}

- (UIButton *)liveButton
{
  if(_liveButton == nil)
  {
      _liveButton = [UIButton buttonWithType:UIButtonTypeCustom];
      _liveButton.tag = DAFAULT_TAG;
      [_liveButton setImage:[UIImage imageNamed:@"shortvideo_main_live"] forState:UIControlStateNormal];
      [_liveButton setTitle:@"直播" forState:UIControlStateNormal];
      [_liveButton setCustomButtonStyle:LZBCustomButtonEdgeInsetsStyle_VerticalImageTop imageTitleSpace:10];
      [_liveButton addTarget:self action:@selector(chooseViewClick:) forControlEvents:UIControlEventTouchUpInside];
      [_liveButton setTitleColor:[UIConstantColor getWordColorC3] forState:UIControlStateNormal];
      _liveButton.titleLabel.font = [UIConstantFont getFontW3_H10];
      _liveButton.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
      
      
  }
    return _liveButton;
}

- (UIButton *)shortVideoButton
{
    if(_shortVideoButton == nil)
    {
        _shortVideoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shortVideoButton.tag = DAFAULT_TAG +1;
        [_shortVideoButton setImage:[UIImage imageNamed:@"shortvideo_main_video"] forState:UIControlStateNormal];
        [_shortVideoButton setTitleColor:[UIConstantColor getWordColorC3] forState:UIControlStateNormal];
        [_shortVideoButton setTitle:@"短视频" forState:UIControlStateNormal];
        [_shortVideoButton addTarget:self action:@selector(chooseViewClick:) forControlEvents:UIControlEventTouchUpInside];
        _shortVideoButton.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _shortVideoButton.titleLabel.font = [UIConstantFont getFontW3_H10];
    }
    return _shortVideoButton;
}

@end
