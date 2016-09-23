//
//  LZBYKDefaultNoDataView.m
//  LZBYKLive
//
//  Created by zibin on 16/9/23.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKDefaultNoDataView.h"

#define default_TopMargin 100*get6sConstantHeightScale()

#define default_TextHeight  30*get6sConstantHeightScale()
#define default_TextMargin  10*get6sConstantHeightScale()

@interface LZBYKDefaultNoDataView()

@property (nonatomic, strong)  UIImageView *coverImageView;
@property (nonatomic, strong)  UILabel *textLabel;
@property (nonatomic, strong)  UIImage *defaultImage;
@property (nonatomic, strong)  NSString *text;
@end

@implementation LZBYKDefaultNoDataView

- (instancetype)initWithFrame:(CGRect)frame WithImage:(UIImage *)defaultImage text:(NSString *)text
{
  if(self = [super initWithFrame:frame])
  {
      [self addSubview:self.coverImageView];
      [self addSubview:self.textLabel];
      self.defaultImage = defaultImage;
      self.text = text;
  }
    return self;
}

- (void)setDefaultImage:(UIImage *)defaultImage
{
    if(defaultImage == nil) return;
    _defaultImage = defaultImage;
    self.coverImageView.image = defaultImage;
}

- (void)setText:(NSString *)text
{
    if(text.length == 0) return;
    _text =text;
    self.textLabel.text = text;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    LZBWeakSelf(weakSelf);
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf.defaultImage.size);
        make.top.left.equalTo(weakSelf);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.width.equalTo(weakSelf);
        make.top.equalTo(weakSelf.coverImageView.mas_bottom).offset(default_TextMargin);
    }];
}

+ (void)showDefaultNoDataViewInView:(UIView *)superView WithImage:(UIImage *)defaultImage text:(NSString *)text
{
    if(defaultImage == nil||text.length == 0) return;
    LZBYKDefaultNoDataView *defaultView = [[LZBYKDefaultNoDataView alloc]initWithFrame:CGRectZero WithImage:defaultImage text:text];
    [superView addSubview:defaultView];
    [defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(defaultImage.size.width);
        make.height.mas_equalTo(defaultImage.size.width + default_TextMargin + default_TextHeight);
        make.centerX.equalTo(superView);
        make.top.equalTo(superView).offset(default_TopMargin);
    }];
}
+ (void)showDefaultNoDataViewInView:(UIView *)superView
{
    [self showDefaultNoDataViewInView:superView WithImage:[UIImage imageNamed:@"live_empty_bg"] text:@"暂时没有关注"];
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

- (UILabel *)textLabel
{
  if(_textLabel == nil)
  {
      _textLabel = [UILabel new];
      _textLabel.textAlignment = NSTextAlignmentCenter;
      _textLabel.numberOfLines = 0;
      _textLabel.textColor = [UIConstantColor getWordColorC4];
      _textLabel.font = [UIConstantFont getFontW3_H11];
  }
    return _textLabel;
}
@end
