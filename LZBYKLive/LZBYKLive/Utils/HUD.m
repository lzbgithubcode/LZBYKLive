//
//  HUD.m
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "HUD.h"
#import <SVProgressHUD.h>

@implementation HUD

+ (void)showMessage:(NSString *)message
{
   [SVProgressHUD showWithStatus:message];
}

+ (void)showSuccessMessage:(NSString *)message
{
    if(message.length > 0)
    [SVProgressHUD showSuccessWithStatus:message];
}

+ (void)showFailMessage:(NSString *)message
{
    if(message.length > 0)
    [SVProgressHUD showErrorWithStatus:message];
}

+ (void)dismissHUD
{
    [SVProgressHUD dismiss];
}


+ (void)showNormalMessage:(NSString *)message
{
  UIAlertView *alterView =  [[UIAlertView alloc]initWithTitle:@"子彬直播" message:message delegate:nil cancelButtonTitle:@
     "知道了"otherButtonTitles:nil, nil];
    [alterView show];
}


@end
