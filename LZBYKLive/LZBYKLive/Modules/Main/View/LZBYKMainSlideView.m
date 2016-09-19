//
//  LZBYKMainSlideView.m
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainSlideView.h"
#define  line_Height 1.0
#define  DEFAULT_MARGIN 15.0
#define DEFAULT_BUTTON_WIDTH  40.0
@interface LZBYKMainSlideView()

@property (nonatomic, strong) LZBYKSlideStyleModel *styleModel;
@property (nonatomic, strong) UIView *underLine;
@property (nonatomic, strong) UIButton *lastSelectButton;
@property (nonatomic, copy) clickSelectHanleBlcok selectHandleBlock;
@end

@implementation LZBYKMainSlideView
- (instancetype)initWithSlideStyleModel:(LZBYKSlideStyleModel *)model selectHandle:(clickSelectHanleBlcok)selectHandle
{
    if(self = [super init])
    {
        self.styleModel = model;
        self.selectHandleBlock = selectHandle;
        [self setupTiltes];
    }
    return self;
}

- (void)setupTiltes
{
    NSInteger count = self.styleModel.tiltes.count;
    LZBWeakSelf(weakSelf);
    UIButton *lastButton = nil;
    for (NSInteger i = 0; i <count; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        [btn setTitle:self.styleModel.tiltes[i] forState:UIControlStateNormal];
        [btn setTitleColor:self.styleModel.normalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.styleModel.selectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.styleModel.normalFont;
        btn.tag = i;
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            if(i == 0)
                make.left.equalTo(weakSelf);
            else
                make.left.equalTo(lastButton.mas_right).offset(DEFAULT_MARGIN);
            make.size.mas_equalTo(CGSizeMake(DEFAULT_BUTTON_WIDTH, DEFAULT_BUTTON_WIDTH));
            make.centerY.equalTo(weakSelf);
        }];
        lastButton = btn;
        
    }
    
    [self.underLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(weakSelf);
        make.width.mas_equalTo(DEFAULT_BUTTON_WIDTH);
        make.height.mas_equalTo(line_Height);
    }];
}

- (void)clickButton:(UIButton *)btn
{
    self.lastSelectButton.selected = NO;
    btn.selected = YES;
    self.lastSelectButton = btn;
    
    if(self.selectHandleBlock)
        self.selectHandleBlock(btn.tag);
}


- (UIView *)underLine
{
  if(_underLine == nil)
  {
      _underLine = [[UIView alloc]initWithFrame:CGRectZero];
      _underLine.backgroundColor = [UIColor redColor];
      [self addSubview:_underLine];
    
  }
    return _underLine;
}


@end
