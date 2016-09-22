//
//  UIConstant.h
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIConstant : NSObject


#pragma mark - 网络请求
+ (NSString *)httpImage_getImageNameString:(NSString *)name withSize:(CGSize)size;

+ (NSString *)httpImage_getNormalImageNameString:(NSString *)name withSize:(CGSize)size;
#pragma mark - 设备信息
/**
 *  当前设置是否是模拟器
 */
+(BOOL)isSimulator;

/**
 *  摄像头是否可用
 */
+ (BOOL)isValidateCamera;

/**
 *  后置摄像头是否可用
 */
+(BOOL)isCameraRearDeviceAvailable;

/**
 *  前置摄像头是否可用
 */
+(BOOL)isCameraFrontDeviceAvailable;

/**
 *  是否支持这种媒体类型
 */
+ (BOOL)isSupportMediaType:(NSString *)mediaType;

/**
 *  照相机是否授权
 */
+ (BOOL)isCameraAuthorization;

/**
 *  麦克风是否授权
 */
+ (BOOL)isAudioAuthorization;


@end
