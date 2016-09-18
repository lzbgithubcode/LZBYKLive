//
//  BaseVC.m
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseVC.h"
#define BUTTON_DEFAULT_MARGIN  5

@interface BaseVC()


@end

@implementation BaseVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    //导航条
    LZBWeakSelf(weakSelf);
    [self.naviBarContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.centerX.equalTo(weakSelf.view);
    }];
    [self.baseContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.bottom.centerX.equalTo(weakSelf.view);
    }];
    
}

- (void)setIsShowCustomBar:(BOOL)isShowCustomBar
{
    _isShowCustomBar = isShowCustomBar;
    if(isShowCustomBar)
    {
        self.navigationController.navigationBar.hidden = YES;
        self.naviBarContentView.hidden = NO;
        self.baseContentView.hidden =NO;
        LZBWeakSelf(weakSelf);
        [self.naviBarContentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LZBSCREEN__NAVIBAR__TOTAL__HEIGHT);
        }];
        [self.baseContentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.naviBarContentView.mas_bottom);
        }];
        [self setupNaviBarContentViewChildView];
    }
    else
    {
        self.navigationController.navigationBar.hidden = NO;
        self.naviBarContentView.hidden = YES;
        self.baseContentView.hidden =YES;
        [self.naviBarContentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(CGFLOAT_MIN);
        }];
        [self.baseContentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(CGFLOAT_MIN);
        }];
    }
}

- (void)setupNaviBarContentViewChildView
{
    LZBWeakSelf(ws);
    [self.baseLeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(LZBSCREEN__NAVIBAR__HEIGHT,LZBSCREEN__NAVIBAR__HEIGHT));
        make.left.equalTo(ws.naviBarContentView).offset(BUTTON_DEFAULT_MARGIN);
        make.bottom.equalTo(ws.naviBarContentView);
    }];
   [self.baseRightButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.size.mas_equalTo(CGSizeMake(LZBSCREEN__NAVIBAR__HEIGHT,LZBSCREEN__NAVIBAR__HEIGHT));
       make.right.equalTo(ws.naviBarContentView).offset(-BUTTON_DEFAULT_MARGIN);
       make.bottom.equalTo(ws.naviBarContentView);
   }];
}

#pragma mark - handle

- (void)addLeftButtonSelector:(SEL)selector
{
    [self.baseLeftButton removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    [self.baseLeftButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}

- (void)addRightButtonSelector:(SEL)selector
{
    [self.baseRightButton removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    [self.baseRightButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLeftButtonImage:(UIImage *)image{
    [self.baseLeftButton setImage:image forState:UIControlStateNormal];
}
- (void)setRightButtonImage:(UIImage *)image{
    [self.baseRightButton setImage:image forState:UIControlStateNormal];
}
- (void)setLeftButtonTitle:(NSString *)title
{
    [self.baseLeftButton setTitle:title forState:UIControlStateNormal];
}
- (void)setRightButtonTitle:(NSString *)title
{
    [self.baseRightButton setTitle:title forState:UIControlStateNormal];
}



#pragma mark - 设置状态条
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusStyle;
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusStyle = statusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - set/get
- (UIView *)naviBarContentView
{
  if(_naviBarContentView == nil)
  {
      _naviBarContentView = [UIView new];
      [self.view addSubview:_naviBarContentView];
  }
    return _naviBarContentView;
}

- (UIView *)baseContentView
{
  if(_baseContentView == nil)
  {
      _baseContentView = [UIView new];
      [self.view addSubview:_baseContentView];
  }
    return _baseContentView;
}

- (UIButton *)baseLeftButton
{
  if(_baseLeftButton == nil)
  {
      _baseLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [_baseLeftButton.titleLabel setFont:[UIConstantFont getFontW3_H11]];
      [_baseLeftButton setTitleColor:[UIConstantColor getWordColorC5] forState:UIControlStateNormal];
      [self.naviBarContentView addSubview:_baseLeftButton];
  }
    return _baseLeftButton;
}

- (UIButton *)baseRightButton
{
  if(_baseRightButton == nil)
  {
      _baseRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [_baseRightButton.titleLabel setFont:[UIConstantFont getFontW3_H11]];
      [_baseRightButton setTitleColor:[UIConstantColor getWordColorC5] forState:UIControlStateNormal];
      [self.naviBarContentView addSubview:_baseRightButton];
  }
    return _baseRightButton;
}

@end
