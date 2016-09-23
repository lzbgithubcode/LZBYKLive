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
@property (nonatomic, copy)   clickSelectHanleBlcok selectHandleBlock;
@property (nonatomic, strong) NSMutableArray <UIButton *>*btns;

@property (nonatomic, assign) NSInteger lastIndex,currenIndex;

// 用于懒加载计算文字的rgb差值, 用于颜色渐变的时候设置
@property (strong, nonatomic) NSArray *deltaRGB;
@property (strong, nonatomic) NSArray *selectedColorRgb;
@property (strong, nonatomic) NSArray *normalColorRgb;
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
        [self.btns addObject:btn];
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
        
        if(i== 1)
        {
            [self clickButton:btn];
            [self.underLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(weakSelf).offset(-5);
                make.centerX.equalTo(btn);
                make.width.mas_equalTo(DEFAULT_BUTTON_WIDTH);
                make.height.mas_equalTo(line_Height);
            }];
            [btn setTitleColor:self.styleModel.selectColor forState:UIControlStateNormal];
            btn.transform = CGAffineTransformMakeScale(self.styleModel.titleScale, self.styleModel.titleScale);
            
        }
        else
            [btn setTitleColor:self.styleModel.normalColor forState:UIControlStateNormal];
    }
    
   
}

- (void)clickButton:(UIButton *)btn
{
    self.lastSelectButton.selected = NO;
    btn.selected = YES;
    self.lastSelectButton = btn;
    
    if(self.selectHandleBlock)
        self.selectHandleBlock(btn.tag);
}

- (void)reloadSegmentViewUIWithProgress:(CGFloat)progress currentIndex:(NSInteger)currentIndex oldIndex:(NSInteger)oldIndex
{
    self.lastIndex = oldIndex;
    UIButton *oldBtn  =self.btns[oldIndex];
    UIButton *currentBtn = self.btns[currentIndex];
    oldBtn.selected = NO;   //去除选中状态的颜色
    
    if(progress > 0.8) progress = 1.0;
    if(progress < 0.2) progress = 0;//排除从0-2的过程颜色变浅
    CGFloat leftProcess =1 -progress;
    CGFloat rightProcess = progress;
    CGFloat scale = self.styleModel.titleScale - 1.0;
    //5.设置左右两边的缩放大小
    oldBtn.transform =CGAffineTransformMakeScale(leftProcess *scale +1 , leftProcess*scale +1);
    currentBtn.transform =CGAffineTransformMakeScale(rightProcess*scale +1, rightProcess*scale +1);
    
    //6.设置文字颜色渐变
    [oldBtn  setTitleColor:[UIColor colorWithRed:[self.selectedColorRgb[0] floatValue] + [self.deltaRGB[0] floatValue] * progress green:[self.selectedColorRgb[1] floatValue] + [self.deltaRGB[1] floatValue] * progress blue:[self.selectedColorRgb[2] floatValue] + [self.deltaRGB[2] floatValue] * progress alpha:1.0] forState:UIControlStateNormal];
    [currentBtn setTitleColor:[UIColor colorWithRed:[self.normalColorRgb[0] floatValue] - [self.deltaRGB[0] floatValue] * progress green:[self.normalColorRgb[1] floatValue] - [self.deltaRGB[1] floatValue] * progress blue:[self.normalColorRgb[2] floatValue] - [self.deltaRGB[2] floatValue] * progress alpha:1.0] forState:UIControlStateNormal];
    
    //下划线
    CGFloat xDistance = currentBtn.center.x - oldBtn.center.x;
    CGPoint bottomCenter = self.underLine.center;
    bottomCenter.x =oldBtn.center.x + xDistance *(progress);
    self.underLine.center = bottomCenter;
}


#pragma mark - 颜色处理
- (NSArray *)deltaRGB
{
    if (_deltaRGB == nil)
    {
        NSArray *normalColorRgb = self.normalColorRgb;
        NSArray *selectedColorRgb = self.selectedColorRgb;
        NSArray *delta = nil;
        if (normalColorRgb && selectedColorRgb)
        {
            CGFloat deltaR = [normalColorRgb[0] floatValue] - [selectedColorRgb[0] floatValue];
            CGFloat deltaG = [normalColorRgb[1] floatValue] - [selectedColorRgb[1] floatValue];
            CGFloat deltaB = [normalColorRgb[2] floatValue] - [selectedColorRgb[2] floatValue];
            delta = [NSArray arrayWithObjects:@(deltaR), @(deltaG), @(deltaB), nil];
            _deltaRGB = delta;
        }
    }
    return _deltaRGB;
}

- (NSArray *)normalColorRgb
{
    if(_normalColorRgb == nil)
    {
        NSArray *normalColorRgb = [self getColorRGB:self.styleModel.normalColor];
        _normalColorRgb = normalColorRgb;
    }
    return _normalColorRgb;
}

- (NSArray *)selectedColorRgb
{
    if(_selectedColorRgb == nil)
    {
        NSArray *selectedColorRgb = [self getColorRGB:self.styleModel.selectColor];
        _selectedColorRgb = selectedColorRgb;
    }
    return _selectedColorRgb;
}
- (NSArray *)getColorRGB:(UIColor *)color
{
    NSInteger numOfcomponents = CGColorGetNumberOfComponents(color.CGColor);
    NSArray *rgbComponents = nil;
    if (numOfcomponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        rgbComponents = [NSArray arrayWithObjects:@(components[0]), @(components[1]), @(components[2]), nil];
    }
    return rgbComponents;
}



- (NSMutableArray<UIButton *> *)btns
{
  if(_btns == nil)
  {
      _btns = [NSMutableArray array];
  }
    return _btns;
}

- (UIView *)underLine
{
  if(_underLine == nil)
  {
      _underLine = [[UIView alloc]initWithFrame:CGRectZero];
      _underLine.backgroundColor = [UIColor orangeColor];
      [self addSubview:_underLine];
    
  }
    return _underLine;
}


@end
