//
//  LZBYKAdvertisementVC.m
//  LZBYKLive
//
//  Created by zibin on 16/9/7.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKAdvertisementVC.h"
#import "UIView+ClipAngle.h"
#import "LonginInterfaceDM.h"

#define backImageView_WidthHeight  215
#define jumpButton_WidthHeight  40
#define jumpButton_Margin 20

@interface LZBYKAdvertisementVC()<UIAlertViewDelegate>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *jumpButton;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CAShapeLayer *processLayer;

@property (nonatomic, assign) NSInteger clockTime;
@end

@implementation LZBYKAdvertisementVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)setupUI
{
   [self.view addSubview:self.backImageView];
   [self.view addSubview:self.titleLabel];
   [self.view addSubview:self.jumpButton];
    
    LZBWeakSelf(weakSelf)
   [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.center.equalTo(weakSelf.view);
       make.size.mas_equalTo(CGSizeMake(backImageView_WidthHeight, backImageView_WidthHeight));
   }];
   [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.equalTo(weakSelf.backImageView.mas_top).offset(-15);
       make.width.equalTo(weakSelf.backImageView);
       make.centerX.equalTo(weakSelf.view);
   }];
    
   [self.jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(jumpButton_WidthHeight);
       make.width.height.mas_equalTo(jumpButton_WidthHeight);
       make.right.equalTo(weakSelf.view).offset(-jumpButton_Margin);
    }];
    
    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self addGradientLayerWithSuperView:self.titleLabel];
    [self.jumpButton lzb_ClipViewWithRound];
    [self addRoundProcessLayerWithSuperView:self.jumpButton];
    
}


- (void)jumpButtonClick
{
    UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:@"您确定关注了吗?" message:nil delegate:self cancelButtonTitle:@"暂不关注" otherButtonTitles:@"已经关注", nil];
    [alterView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   if(buttonIndex == 1)
   {
     [self.navigationController pushViewController:[LonginInterfaceDM l_instanceLZBYKLoginVC] animated:YES];
   }
   
}

#pragma mark - 增加圆形进度条
- (void)addRoundProcessLayerWithSuperView:(UIView *)superView
{
    self.processLayer.frame = superView.bounds;
    self.processLayer.fillColor = [UIColor clearColor].CGColor;
    self.processLayer.lineWidth = 2.0;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:superView.bounds];
    self.processLayer.path = circlePath.CGPath;
    self.processLayer.strokeColor = [UIColor redColor].CGColor;
    self.processLayer.strokeStart = 0;
    self.processLayer.strokeEnd = 1.0;
    [superView.layer addSublayer:self.processLayer];
    [self startTime];
}

- (void)startTime
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerClocking) userInfo:nil repeats:YES];
}
- (void)timerClocking
{
    self.processLayer.strokeEnd -=0.02;
    if(self.processLayer.strokeEnd < 0.0)
    {
        [self stopTime];
        self.jumpButton.userInteractionEnabled = YES;
        [self addTransformScaleWithSuperView:self.jumpButton];
    }
    
}
- (void)stopTime
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - 增加放大效果
- (void)addTransformScaleWithSuperView:(UIView *)superView
{
    CAKeyframeAnimation *basc = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    basc.values = @[@1.0,@1.2,@1.0];
    basc.duration = 1.0;
    basc.repeatCount = CGFLOAT_MAX;
    [superView.layer addAnimation:basc forKey:@"transform"];
}

#pragma mark - 增加渐变颜色
- (void)addGradientLayerWithSuperView:(UIView *)superView;
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.anchorPoint = CGPointMake(0, 0);
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1, 0.5);
    gradient.colors = @[(__bridge id)[UIColor colorWithWhite:0.6 alpha:1.0].CGColor,
                        (__bridge id)[UIColor redColor].CGColor,
                        (__bridge id)[UIColor colorWithWhite:0.6 alpha:1.0].CGColor,];
    gradient.locations = @[@0.2,@0.5,@0.8];
    gradient.bounds =self.view.bounds;
    [self.view.layer addSublayer:gradient];
    [self addAnimationToLayer:gradient];
    gradient.mask = superView.layer;
}

- (void)addAnimationToLayer:(CALayer *)layer
{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"locations"];
    basic.fromValue = @[@0,@0,@0.4];
    basic.toValue = @[@0.6,@0.8,@1.0];
    basic.duration =3.0;
    basic.repeatCount = MAXFLOAT;
    [layer addAnimation:basic forKey:NSStringFromClass([layer class])];
}


#pragma mark- set/get

- (UIButton *)jumpButton
{
  if(_jumpButton == nil)
  {
      _jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [_jumpButton setTitle:@"点击\n跳过" forState:UIControlStateNormal];
      [_jumpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      _jumpButton.titleLabel.font = [UIConstantFont getFontW3_H14];
      _jumpButton.titleLabel.numberOfLines = 0;
      _jumpButton.titleLabel.textAlignment = NSTextAlignmentCenter;
      _jumpButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
      _jumpButton.userInteractionEnabled = NO;
      [_jumpButton addTarget:self action:@selector(jumpButtonClick) forControlEvents:UIControlEventTouchUpInside];
  }
    return _jumpButton;
}
- (UIImageView *)backImageView
{
  if(_backImageView == nil)
  {
      _backImageView =[UIImageView new];
      _backImageView.contentMode = UIViewContentModeScaleAspectFill;
      _backImageView.clipsToBounds = YES;
      _backImageView.image =[UIImage imageNamed:@"wenxin_tuanguan_icon.jpg"];
     
  }
    return _backImageView;
}

- (UILabel *)titleLabel
{
   if(_titleLabel == nil)
   {
       _titleLabel = [[UILabel alloc]init];
       _titleLabel.textAlignment = NSTextAlignmentCenter;
       _titleLabel.font = [UIConstantFont getFontW3_H6];
       _titleLabel.numberOfLines = 0;
       _titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
       _titleLabel.text = @"扫码关注微信公众号，共享更多demo";
   }
    return _titleLabel;
}

- (CAShapeLayer *)processLayer
{
  if(_processLayer == nil)
  {
      _processLayer = [CAShapeLayer layer];
  }
    return _processLayer;
}
@end
