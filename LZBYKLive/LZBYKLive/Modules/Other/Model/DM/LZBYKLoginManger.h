//
//  LZBYKLoginManger.h
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseHttpDataManger.h"

@protocol LZBYKLoginMangerDelegate <NSObject>

/**
 *  登陆成功
 */
- (void)didLogInSucess;

/**
 *  退出成功
 */
- (void)didLogOutSucess;

@end



@interface LZBYKLoginManger : BaseHttpDataManger

/**
 *  登陆上传数据
 *
 *  @param phone       手机号
 *  @param passWord    密码
 *  @param compeletion 登陆结果
 */
- (void)loginWithUserTel:(NSString *)phone password:(NSString *)passWord compeletion:(void(^)(NSError *error))compeletion;
@end
