//
//  LZBYKAdvertisementVC.m
//  LZBYKLive
//
//  Created by zibin on 16/9/7.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKAdvertisementVC.h"

#define backImageView_WidthHeight  215
@interface LZBYKAdvertisementVC()

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *jumpButton;
@end

@implementation LZBYKAdvertisementVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    
}

- (void)setupUI
{
   [self.view addSubview:self.backImageView];
   [self.view addSubview:self.titleLabel];
    
    LZBWeakSelf(weakSelf)
   [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.center.equalTo(weakSelf.view);
       make.size.mas_equalTo(CGSizeMake(backImageView_WidthHeight, backImageView_WidthHeight));
   }];
   [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.equalTo(weakSelf.backImageView.mas_top).offset(-15);
       make.centerX.equalTo(weakSelf.view);
   }];
    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self addGradientLayerWithSuperView:self.titleLabel];
}


- (void)addGradientLayerWithSuperView:(UIView *)superView;
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.anchorPoint = CGPointMake(0, 0);
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1, 0.5);
    gradient.colors = @[(__bridge id)[UIColor colorWithWhite:0.6 alpha:1.0].CGColor,
                        (__bridge id)[UIColor whiteColor].CGColor,
                        (__bridge id)[UIColor colorWithWhite:0.6 alpha:1.0].CGColor,];
    gradient.locations = @[@0.2,@0.5,@0.8];
    [self.view.layer addSublayer:gradient];
    [self addAnimationToLayer:gradient];
    gradient.mask = superView.layer;
    gradient.bounds = self.view.bounds;
    
    
}

- (void)addAnimationToLayer:(CALayer *)layer
{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"locations"];
    basic.fromValue = @[@0,@0,@0.3];
    basic.toValue = @[@0.7,@1.0,@1.0];
    basic.duration =3.0;
    basic.repeatCount = MAXFLOAT;
    [layer addAnimation:basic forKey:NSStringFromClass([layer class])];
}


#pragma mark- set/get
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
       _titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
       _titleLabel.text = @"这就是一个广告";
   }
    return _titleLabel;
}
@end
