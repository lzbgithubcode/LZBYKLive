//
//  LZBYKLoginManger.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKLoginManger.h"

@implementation LZBYKLoginManger
- (void)loginWithUserTel:(NSString *)phone password:(NSString *)passWord compeletion:(void(^)(NSError *error))compeletion
{
    //网络请求数据
    [HUD showMessage:nil];
    LZBWeakSelf(weakSelf);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [HUD dismissHUD];
        [weakSelf delegateDataMangerCallBackSelector:@selector(didLogInSucess) withObject:nil withAnotherObject:nil];
        if(compeletion)
            compeletion(nil);
    });
    
}
@end
