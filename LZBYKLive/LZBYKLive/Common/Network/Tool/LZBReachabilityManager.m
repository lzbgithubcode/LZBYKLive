//
//  LZBReachabilityManager.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBReachabilityManager.h"
#import <AFNetworkReachabilityManager.h>

static LZBReachabilityManager *_instance;
@interface LZBReachabilityManager()

@property (nonatomic, strong) UILabel *tipLabel;
@end


@implementation LZBReachabilityManager

#pragma mark - 实例化
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LZBReachabilityManager alloc]init];
    });
    return _instance;
}

+ (instancetype)removeInstance
{
    _instance = nil;
    return _instance;
}


#pragma mark - hanle
- (void)reachabilityIsOpen:(BOOL)open
{
    if(!open) return;
    LZBWeakSelf(weakSelf);
    __block NSString *tips = nil;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                {
                     tips = @"当前无网络, 请检查您的网络状态";
                    [weakSelf showStatusViewWithTips:tips];
                }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                {
                      tips = @"当前为非WIFI环境，耗费您的流量";
                    [weakSelf showStatusViewWithTips:tips];
                }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                {
                    tips = nil;
                    [weakSelf removeStatusView];
                }
                break;
            default:
                 [weakSelf removeStatusView];
                break;
        }

    }];
}


- (void)showStatusViewWithTips:(NSString *)tips
{
    if([[UIApplication sharedApplication].keyWindow.subviews containsObject:self.tipLabel])
        return;
    [[UIApplication sharedApplication].keyWindow addSubview:self.tipLabel];
    self.tipLabel.text = tips;
    LZBWeakSelf(weakSelf);
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.tipLabel.lzb_y = 0;
    }];
}

- (void)removeStatusView
{
    if(![[UIApplication sharedApplication].keyWindow.subviews containsObject:self.tipLabel])
        return;
    LZBWeakSelf(weakSelf);
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.tipLabel.lzb_y = -LZBSCREEN__NAVIBAR__TOTAL__HEIGHT;
    } completion:^(BOOL finished) {
        [weakSelf.tipLabel removeFromSuperview];
    }];
    
}



#pragma mark - get/set
- (UILabel *)tipLabel
{
   if(_tipLabel == nil)
   {
       _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, -LZBSCREEN__NAVIBAR__TOTAL__HEIGHT, LZBSCREEN__WIDTH, LZBSCREEN__NAVIBAR__TOTAL__HEIGHT)];
       [_tipLabel setBackgroundColor:[UIColor blackColor]];
       [_tipLabel setTextAlignment:NSTextAlignmentCenter];
       [_tipLabel setFont:[UIFont systemFontOfSize:15]];
       [_tipLabel setTextColor:[UIColor whiteColor]];
       [_tipLabel setUserInteractionEnabled:NO];
       
       CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
       animation.fromValue=[NSNumber numberWithFloat:0.6];
       animation.toValue=[NSNumber numberWithFloat:0.8];
       animation.autoreverses=YES;
       animation.duration=2.0;
       animation.repeatCount=HUGE;
       animation.removedOnCompletion=NO;
       animation.fillMode=kCAFillModeForwards;
       [_tipLabel.layer addAnimation:animation forKey:@"rotationAnimation"];
   }
    return _tipLabel;
}

@end
