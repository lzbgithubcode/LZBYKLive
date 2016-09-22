//
//  LZBYKMainHotCell.m
//  LZBYKLive
//
//  Created by zibin on 16/9/22.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainHotCell.h"
#import "UIImage+Common.h"

#define iconImageView_Width  36
#define iconImageView_Height  iconImageView_Width
#define defult_Margin 10

#define default_location_address @"难道是在火星?"

@implementation LZBYKMainHotCellModel

- (CGFloat)cellHeight
{
   if(_cellHeight == 0)
   {
       //1.头像
       CGFloat iconImageViewX = defult_Margin;
       CGFloat iconImageViewY = defult_Margin;
       CGFloat iconImageViewW = iconImageView_Width;
       CGFloat iconImageViewH = iconImageView_Height;
       _iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
       
       //2.名字
       CGSize nameSize = self.liver_name.length>0
       ?[self.liver_name sizeWithAttributes:@{NSFontAttributeName :[UIConstantFont getFontW3_H11]}]:CGSizeZero;
       CGFloat nameLabelX = defult_Margin + CGRectGetMaxX(_iconImageViewFrame);
       CGFloat nameLabelY = iconImageViewY;
       CGFloat nameLabelW = nameSize.width;
       CGFloat nameLabelH = nameSize.height;
       _nameLabelFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
       
       //3.地点
       CGSize locationSize = [self.liver_city.length > 0?self.liver_city:default_location_address sizeWithAttributes:@{NSFontAttributeName :[UIConstantFont getFontW3_H12]}];
       CGFloat locationButtonW = locationSize.width;
       CGFloat locationButtonH = locationSize.height;
       CGFloat locationButtonX = nameLabelX;
       CGFloat locationButtonY = CGRectGetMaxY(_iconImageViewFrame) - locationButtonH;
       _locationButtonFrame = CGRectMake(locationButtonX, locationButtonY, locationButtonW, locationButtonH);
       
       //4.观看人数
        CGSize peopleLabelSize = self.audience_count.length > 0?[self.audience_count sizeWithAttributes:@{NSFontAttributeName :[UIConstantFont getFontW3_H12]}]:CGSizeZero;
       CGFloat peopleLabelW = peopleLabelSize.width;
       CGFloat peopleLabelH = peopleLabelSize.height;
       CGFloat peopleLabelX = LZBSCREEN__WIDTH -peopleLabelW -defult_Margin;
       CGFloat peopleLabelY = iconImageViewY;
       _peopleLabelFrame = CGRectMake(peopleLabelX, peopleLabelY, peopleLabelW, peopleLabelH);
       
       //5.标签
       CGFloat tipLabelW = LZBSCREEN__WIDTH * 0.2;
       CGFloat tipLabelH = locationButtonH;
       CGFloat tipLabelX = LZBSCREEN__WIDTH -tipLabelW -defult_Margin;
       CGFloat tipLabelY = locationButtonY;
       _tipLabelFrame = CGRectMake(tipLabelX, tipLabelY, tipLabelW, tipLabelH);
       
       //6.内容图片
       CGFloat contentImageViewX = 0;
       CGFloat contentImageViewY = CGRectGetMaxY(_iconImageViewFrame) + defult_Margin;
       CGFloat contentImageViewW = LZBSCREEN__WIDTH;
       CGFloat contentImageViewH =LZBSCREEN__WIDTH *618/480;
       _contentImageViewFrame = CGRectMake(contentImageViewX, contentImageViewY, contentImageViewW, contentImageViewH);
       _cellHeight = CGRectGetMaxY(_contentImageViewFrame);
   }
   
    return _cellHeight;
}

@end


@interface LZBYKMainHotCell()

@property (nonatomic, strong)  UIImageView *iconImageView;
@property (nonatomic, strong)  UILabel *nameLabel;
@property (nonatomic, strong)  UIButton *locationButton;
@property (nonatomic, strong)  UILabel *peopleLabel;
@property (nonatomic, strong)  UILabel *tipLabel;
@property (nonatomic, strong)  UIImageView *contentImageView;
@end
@implementation LZBYKMainHotCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
   {
       self.selectionStyle = UITableViewCellSelectionStyleNone;
       [self setupUI];
   }
    return self;
}

- (void)setupUI
{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.locationButton];
    [self.contentView addSubview:self.peopleLabel];
    [self.contentView addSubview:self.tipLabel];
    [self.contentView addSubview:self.contentImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconImageView.frame = self.cellModel.iconImageViewFrame;
    self.nameLabel.frame = self.cellModel.nameLabelFrame;
    self.locationButton.frame = self.cellModel.locationButtonFrame;
    self.peopleLabel.frame = self.cellModel.peopleLabelFrame;
    self.tipLabel.frame = self.cellModel.tipLabelFrame;
    self.contentImageView.frame = self.cellModel.contentImageViewFrame;
    
}

- (void)setCellModel:(LZBYKMainHotCellModel *)cellModel
{
    if(cellModel == nil) return;
    _cellModel = cellModel;
    LZBWeakSelf(weakSelf);
    NSString *portaitUrl = [UIConstant httpImage_getNormalImageNameString:cellModel.liver_portrait withSize:CGSizeZero];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:portaitUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
    self.nameLabel.text = cellModel.liver_name.length > 0?cellModel.liver_name:@"无名氏";
    [self.locationButton setTitle:cellModel.liver_city.length > 0?cellModel.liver_city:default_location_address forState:UIControlStateNormal];
    self.peopleLabel.text = cellModel.audience_count;
    self.tipLabel.text = @"在看";
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:[UIConstant httpImage_getNormalImageNameString:cellModel.liver_portrait withSize:CGSizeZero]] placeholderImage:[UIImage imageNamed:@"default_photo"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [LZBCommonTool animationOptionTransitionCrossDissolveView:weakSelf.contentImageView];
    }];
    
}

#pragma mark- set/get
- (UIImageView *)iconImageView
{
  if(_iconImageView == nil)
  {
      _iconImageView = [UIImageView new];
      _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
      _iconImageView.clipsToBounds = YES;
      _iconImageView.layer.cornerRadius = iconImageView_Height *0.5;
      _iconImageView.layer.masksToBounds =YES;
      _iconImageView.layer.borderColor = [UIColor orangeColor].CGColor;
      _iconImageView.layer.borderWidth = 1.0;
  }
    return _iconImageView;
}

- (UILabel *)nameLabel
{
  if(_nameLabel == nil)
  {
      _nameLabel = [UILabel new];
      _nameLabel.text = @"高仿子彬映客";
      _nameLabel.textColor = [UIConstantColor getWordColorC1];
      _nameLabel.font = [UIConstantFont getFontW3_H11];
  }
    return _nameLabel;
}

- (UIButton *)locationButton
{
  if(_locationButton == nil)
  {
      _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
     [_locationButton setTitle:@"中国" forState:UIControlStateNormal];
      _locationButton.titleLabel.font = [UIConstantFont getFontW3_H12];
      [_locationButton setTitleColor:[UIConstantColor getWordColorC2] forState:UIControlStateNormal];
  }
    return _locationButton;
}

- (UILabel *)peopleLabel
{
  if(_peopleLabel == nil)
  {
      _peopleLabel = [UILabel new];
      _peopleLabel.text = @"9999";
      _peopleLabel.textColor = [UIColor orangeColor];
      _peopleLabel.font = [UIConstantFont getFontW3_H12];
      _peopleLabel.textAlignment = NSTextAlignmentRight;
  }
    return _peopleLabel;
}

- (UILabel *)tipLabel
{
  if(_tipLabel == nil)
  {
      _tipLabel = [UILabel new];
      _tipLabel.text = @"在看";
      _tipLabel.textColor = [UIConstantColor getWordColorC2];
      _tipLabel.font = [UIConstantFont getFontW3_H12];
      _tipLabel.textAlignment = NSTextAlignmentRight;
  }
    return _tipLabel;
}
- (UIImageView *)contentImageView
{
  if(_contentImageView == nil)
  {
      _contentImageView = [UIImageView new];
      _contentImageView.contentMode = UIViewContentModeScaleAspectFill;
      _contentImageView.clipsToBounds = YES;
  }
    return _contentImageView;
}
@end
