//
//  LZBYKLoginVC.m
//  LZBYKLive
//
//  Created by zibin on 16/9/1.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKLoginVC.h"
#import "LZBYKShareSDKManger.h"
#import "LZBYKLoginManger.h"

#define default_Margin 50
#define default_Tag  100
#define yunImageView_Width    70
#define yunImageView_Height    45
#define yunImageView_image  [UIImage imageNamed:@"loginyyun"]

//第三方登录
#define centerLabel_BottomMargin 200
#define lineView_Width 80
#define lineView_Height 1
#define lineView_Margin 15

#define thridLogin_TopMargin 30

@interface LZBYKLoginVC()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIView *rightLineView;
@property (nonatomic, strong) UILabel *centerLabel;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *textLable;

@end

@implementation LZBYKLoginVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.statusStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor = [UIConstantColor getLonginBackColor];
    [self setupUI];
    
}

- (void)setupUI
{
    //白云
    for(NSInteger i = 0; i < 3; i++)
    {
        UIImageView *yunImageView = [UIImageView new];
        yunImageView.image  = yunImageView_image;
        [self.view addSubview:yunImageView];
        yunImageView.tag = default_Tag + i;
        CGFloat imageX = 0;
        CGFloat imageY = i*(yunImageView_Height + default_Margin) + default_Margin;
        CGFloat imageW = yunImageView_Width * (1 + (2-i)/2.0);
        CGFloat imageH = yunImageView_Height *(1 + (2-i)/2.0);
        yunImageView.frame = CGRectMake(imageX,imageY, imageW, imageH);
        [self addMoveAnimationWithView:yunImageView];
    };
     LZBWeakSelf(weakSelf);
     //中间提示文字
    [self.textLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view).offset(-30);
    }];
    
    //登录方式
   
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view).offset(-centerLabel_BottomMargin);
    }];
    
    [self.leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.centerLabel);
        make.width.mas_equalTo(lineView_Width);
        make.right.equalTo(weakSelf.centerLabel.mas_left).offset(-lineView_Margin);
        make.height.mas_equalTo(lineView_Height);
    }];
    
    [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.centerLabel);
        make.width.mas_equalTo(lineView_Width);
        make.left.equalTo(weakSelf.centerLabel.mas_right).offset(lineView_Margin);
        make.height.mas_equalTo(lineView_Height);
    }];
    
    //三方登录按钮
    UIButton *lastButton = nil;
    NSArray *thirdLongin = @[@"login_weibo",@"login_wx",@"login_dx",@"login_qq"];
    for (NSInteger i = 0 ; i < thirdLongin.count; i++)
    {
        UIButton *btn = [self creatSignleButtonWithImage:thirdLongin[i]];
        btn.tag = i;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.centerLabel.mas_bottom).offset(thridLogin_TopMargin);
            make.size.mas_equalTo(CGSizeMake(50, 50));
            if(i == 0)
                make.left.equalTo(weakSelf.leftLineView);
            else
                make.left.equalTo(lastButton.mas_right).offset(20);
        }];
        lastButton = btn;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //提示
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(-30);
        make.centerX.equalTo(weakSelf.view);
    }];
    self.tipLabel.attributedText = [self getMutableAttributedStringWithString:@"登录代表想看看子彬的高仿映客demo"];
}

- (NSMutableAttributedString *)getMutableAttributedStringWithString:(NSString *)string
{
    NSMutableAttributedString *mustring = [[NSMutableAttributedString alloc]initWithString:string];
    NSRange range = NSMakeRange(0, string.length);
    NSRange subRange = [string rangeOfString:@"子"];
    NSRange changeRange = NSMakeRange(subRange.location, range.length-subRange.location);
    [mustring addAttribute:NSFontAttributeName value:[UIConstantFont getFontW3_H15] range:range];
    [mustring addAttribute:NSForegroundColorAttributeName value:[UIConstantColor getWordColorC3] range:range];
    [mustring addAttribute:NSForegroundColorAttributeName value:[UIConstantColor getThemeColor] range:changeRange];
    [mustring addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:changeRange];
    return mustring;
}


#pragma mark - hanle

- (void)btnClick:(UIButton *)button
{
    //手机登陆
    [[LZBYKShareSDKManger shareInstance] sharkSDKLoginUserRegisterType:eUserRegisterType_Phone];
    [[LZBYKLoginManger shareInstance] loginWithUserTel:nil password:nil compeletion:^(NSError *error) {
        
    }];
}
- (UIButton *)creatSignleButtonWithImage:(NSString *)imageString
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    return button;
}

- (void)addMoveAnimationWithView:(UIView *)animationView
{
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    //设置通过动画，将layer从哪儿移动到哪儿
    moveAnimation.fromValue=[NSValue valueWithCGPoint:CGPointMake(LZBSCREEN__WIDTH +LZBSCREEN__WIDTH * 0.2 , animationView.lzb_CenterY)];
    moveAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(-LZBSCREEN__WIDTH * 0.2, animationView.lzb_CenterY)];
   
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = @[@1.0,@1.5,@1.0];

    CAAnimationGroup *grop = [CAAnimationGroup animation];
    grop.animations = @[moveAnimation,scaleAnimation];
    grop.fillMode = kCAFillModeForwards;
    grop.repeatCount = CGFLOAT_MAX;
    grop.duration = (animationView.tag - default_Tag) ==1?20: (animationView.tag - default_Tag)*20.0 + 40.0;
    [animationView.layer addAnimation:grop forKey:[NSString stringWithFormat:@"animationView-%ld",animationView.tag]];
}

#pragma mark - set/get
- (UIView *)leftLineView
{
  if(_leftLineView == nil)
  {
      _leftLineView = [UIView new];
      _leftLineView.backgroundColor = [UIConstantColor getWordColorC4];
      [self.view addSubview:_leftLineView];
  }
    return _leftLineView;
}
- (UIView *)rightLineView
{
    if(_rightLineView == nil)
    {
        _rightLineView = [UIView new];
        _rightLineView.backgroundColor = self.leftLineView.backgroundColor;
        [self.view addSubview:_rightLineView];
    }
    return _rightLineView;
}

-(UILabel *)centerLabel
{
  if(_centerLabel == nil)
  {
      _centerLabel = [UILabel new];
      _centerLabel.font = [UIConstantFont getFontW3_H14];
      _centerLabel.textColor = [UIConstantColor getWordColorC3];
      _centerLabel.textAlignment = NSTextAlignmentCenter;
      _centerLabel.text = @"请选择登录方式";
     [self.view addSubview:_centerLabel];
  }
    return _centerLabel;
}

- (UILabel *)tipLabel
{
  if(_tipLabel == nil)
  {
      _tipLabel = [UILabel new];
      [self.view addSubview:_tipLabel];
  }
    return _tipLabel;
}

- (UILabel *)textLable
{
  if(_textLable == nil)
  {
      _textLable = [UILabel new];
      [self.view addSubview:_textLable];
      _textLable.font = [UIConstantFont getFontW3_H8];
      _textLable.textColor = [UIColor blueColor];
      _textLable.textAlignment = NSTextAlignmentCenter;
      _textLable.text = @"这里有些文提示文字,点击任意一个可以登陆";
      _textLable.numberOfLines = 0;
  }
    return _textLable;
}


@end
