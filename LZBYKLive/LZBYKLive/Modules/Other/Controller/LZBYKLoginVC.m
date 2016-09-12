//
//  LZBYKLoginVC.m
//  LZBYKLive
//
//  Created by zibin on 16/9/1.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKLoginVC.h"


#define default_Margin 50
#define default_Tag  100
#define yunImageView_Width    70
#define yunImageView_Height    45
#define yunImageView_image  [UIImage imageNamed:@"loginyyun"]

@interface LZBYKLoginVC()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) CAShapeLayer *scaleLayer;
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
    
}

- (void)addMoveAnimationWithView:(UIView *)animationView
{
//    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
//    //设置通过动画，将layer从哪儿移动到哪儿
//    moveAnimation.fromValue=[NSValue valueWithCGPoint:CGPointMake(LZBSCREEN__WIDTH +LZBSCREEN__WIDTH * 0.2 , animationView.lzb_CenterY)];
//    moveAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(-LZBSCREEN__WIDTH * 0.2, animationView.lzb_CenterY)];
//    moveAnimation.duration = (animationView.tag - default_Tag) ==1?20: (animationView.tag - default_Tag)*20.0 + 40.0;
//    moveAnimation.repeatCount = CGFLOAT_MAX;
//    moveAnimation.fillMode=kCAFillModeForwards;
//    [animationView.layer addAnimation:moveAnimation forKey:[NSString stringWithFormat:@"animationView-%ld",animationView.tag]];
    [self addScaleAnimationWithView:animationView];
}

- (void)addScaleAnimationWithView:(UIView *)animationView
{
   CAShapeLayer *scaleLayer = [CAShapeLayer layer];
    scaleLayer.frame = animationView.bounds;
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = @[@1.0,@1.5,@1.0];
    scaleAnimation.duration = 1.0;
    scaleAnimation.repeatCount = CGFLOAT_MAX;
    scaleAnimation.fillMode=kCAFillModeForwards;
    [animationView.layer addSublayer:scaleLayer];
    [scaleLayer addAnimation:scaleAnimation forKey:@"transform.scale"];
}








@end
