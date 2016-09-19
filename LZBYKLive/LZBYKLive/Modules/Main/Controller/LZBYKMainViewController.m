//
//  LZBYKMainViewController.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainViewController.h"
#import "LZBYKMainSlideView.h"

@interface LZBYKMainViewController()

@property (nonatomic, strong) LZBYKMainSlideView *slideView;

@property (nonatomic, strong) LZBYKSlideStyleModel *slideModel;

@end

@implementation LZBYKMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavi];
    
}

- (void)setupNavi
{
    self.isShowCustomBar = YES;
    self.naviBarContentView.backgroundColor = [UIConstantColor getNaviBlueColor];
    self.statusStyle = UIStatusBarStyleLightContent;
    [self setLeftButtonImage:[UIImage imageNamed:@"searchbar_search"]];
    [self setRightButtonImage:[UIImage imageNamed:@"searchbar_search"]];
    LZBWeakSelf(weakSelf);
    [self.slideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.baseLeftButton.mas_right).offset(45);
        make.right.equalTo(weakSelf.baseRightButton.mas_left).offset(-45);
        make.centerX.equalTo(weakSelf.naviBarContentView);
        make.centerY.equalTo(weakSelf.baseLeftButton);
        make.height.mas_equalTo(LZBSCREEN__NAVIBAR__HEIGHT);
    }];
}


- (LZBYKSlideStyleModel *)slideModel
{
  if(_slideModel == nil)
  {
      _slideModel = [[LZBYKSlideStyleModel alloc]init];
      _slideModel.tiltes = @[@"关注",@"热门",@"附近"];
      _slideModel.normalFont = [UIConstantFont getFontW3_H11];
      _slideModel.normalColor = [UIConstantColor getWordColorC5];
      _slideModel.selectColor = [UIColor redColor];
  }
    return _slideModel;
}

- (LZBYKMainSlideView *)slideView
{
  if(_slideView == nil)
  {
      _slideView = [[LZBYKMainSlideView alloc]initWithSlideStyleModel:self.slideModel selectHandle:^(LZBYKMainSlideViewType type) {
          
      }];
      [self.naviBarContentView addSubview:_slideView];
  }
    return _slideView;
}

@end
