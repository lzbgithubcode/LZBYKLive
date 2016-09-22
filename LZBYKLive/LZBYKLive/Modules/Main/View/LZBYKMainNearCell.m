//
//  LZBYKMainNearCell.m
//  LZBYKLive
//
//  Created by zibin on 16/9/22.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainNearCell.h"

#define countButton_Width 60
#define countButton_Height 15
#define countButton_Margin 10

@implementation LZBYKMainNearCellModel
- (CGFloat)cellHeight
{
   if(_cellHeight == 0)
   {
       //1.背景头像
       CGFloat coverImageViewFrameX = 0;
       CGFloat coverImageViewFrameY = 0;
       CGFloat coverImageViewFrameW =(LZBSCREEN__WIDTH - (default_EveryRow_Count+1) *default_Margin)/default_EveryRow_Count;;
       CGFloat coverImageViewFrameH = coverImageViewFrameW;
       _coverImageViewFrame = CGRectMake(coverImageViewFrameX, coverImageViewFrameY, coverImageViewFrameW, coverImageViewFrameH);
       
       //2.个数按钮
       CGFloat countButtonFrameX = 0;
       CGFloat countButtonFrameY = CGRectGetMaxY(_coverImageViewFrame) + countButton_Margin;
       CGFloat countButtonFrameW = countButton_Width;
       CGFloat countButtonFrameH = countButton_Height;
       _countButtonFrame = CGRectMake(countButtonFrameX, countButtonFrameY, countButtonFrameW, countButtonFrameH);
       
       //3.距离
       CGFloat distanceLabelW = coverImageViewFrameW * 0.5;
       CGFloat distanceLabelH = countButtonFrameH;
       CGFloat distanceLabelX = coverImageViewFrameW - distanceLabelW;
       CGFloat distanceLabelY = countButtonFrameY;
       _distanceLabelFrame = CGRectMake(distanceLabelX, distanceLabelY, distanceLabelW, distanceLabelH);
       
       _cellHeight = CGRectGetMaxY(_distanceLabelFrame) + countButton_Margin;
   
   }
    return _cellHeight;
}


@end

@interface LZBYKMainNearCell()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UIButton *countButton;
@property (nonatomic, strong) UILabel *distanceLabel;
@end

@implementation LZBYKMainNearCell

- (instancetype)initWithFrame:(CGRect)frame
{
  if(self = [super initWithFrame:frame])
  {
      [self setupUI];
  }
    return self;
}

- (void)setupUI
{
    [self addSubview:self.coverImageView];
    [self addSubview:self.countButton];
    [self addSubview:self.distanceLabel];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.coverImageView.frame = self.cellModel.coverImageViewFrame;
    self.countButton.frame = self.cellModel.countButtonFrame;
    self.distanceLabel.frame = self.cellModel.distanceLabelFrame;
}

- (void)setCellModel:(LZBYKMainNearCellModel *)cellModel
{
    if(cellModel == nil) return;
    _cellModel = cellModel;
    LZBWeakSelf(weakSelf);
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:[UIConstant httpImage_getNormalImageNameString:cellModel.liver_portrait withSize:CGSizeZero]] placeholderImage:[UIImage imageNamed:@"default_photo"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [LZBCommonTool animationOptionTransitionCrossDissolveView:weakSelf.coverImageView];
    }];
    [self.countButton setTitle:cellModel.liver_count forState:UIControlStateNormal];
    self.distanceLabel.text = cellModel.liver_distance;
}

- (UIImageView *)coverImageView
{
   if(_coverImageView == nil)
   {
       _coverImageView = [UIImageView new];
       _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
       _coverImageView.clipsToBounds = YES;
   }
    return _coverImageView;
}

- (UIButton *)countButton
{
  if(_countButton == nil)
  {
      _countButton = [UIButton buttonWithType:UIButtonTypeCustom];
      _countButton.backgroundColor = [UIColor greenColor];
      _countButton.titleLabel.font = [UIConstantFont getFontW3_H12];
      _countButton.titleLabel.textColor = [UIConstantColor getWordColorC5];
      _countButton.imageView.contentMode = UIViewContentModeCenter;
      _countButton.imageView.clipsToBounds =YES;
      [_countButton setImage:[UIImage imageNamed:@"DazStarOutline"] forState:UIControlStateNormal];
      [_countButton setTitle:@"2" forState:UIControlStateNormal];
  }
    return _countButton;
}

- (UILabel *)distanceLabel
{
  if(_distanceLabel == nil)
  {
      _distanceLabel = [UILabel new];
      _distanceLabel.textColor = [UIConstantColor getWordColorC2];
      _distanceLabel.font = [UIConstantFont getFontW3_H12];
  }
    return _distanceLabel;
}
@end
