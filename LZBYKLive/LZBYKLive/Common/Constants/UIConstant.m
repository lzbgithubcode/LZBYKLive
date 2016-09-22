//
//  UIConstant.m
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//


#import "UIDevice+Extension.h"
#import <AVFoundation/AVFoundation.h>
#define image_base_URL   @"http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?"

@implementation UIConstant

#pragma mark - image请求
+ (NSString *)httpImage_getImageNameString:(NSString *)name withSize:(CGSize)size
{
    NSString *base_ImageUrl = [NSString stringWithFormat:@"%@url=http%%3A%%2F%%2Fimg.meelive.cn%%",image_base_URL];
    NSString *fullImageUrl = [base_ImageUrl stringByAppendingFormat:@"%@&w=%.0f&s=80&h=%.0f&c=0&o=0",name,size.width,size.height];
    return fullImageUrl;
}


#pragma mark- 设备信息
+(BOOL)isSimulator
{
   return[[UIDevice deviceType] isEqualToString:@"Simulator"];
}

+ (BOOL)isValidateCamera
{
   return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+(BOOL)isCameraRearDeviceAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}
+(BOOL)isCameraFrontDeviceAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

+ (BOOL)isSupportMediaType:(NSString *)mediaType
{
    NSArray *medias = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    for (NSString *subMeidaType in medias) {
        if([subMeidaType  isEqualToString:mediaType])
        {
            return YES;
            break;
        }
    }
    return NO;
}

+ (BOOL)isCameraAuthorization;
{
    AVAuthorizationStatus authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authorizationStatus == AVAuthorizationStatusRestricted ||AVAuthorizationStatusDenied==authorizationStatus)
        return NO;
    else
        return YES;
}

+ (BOOL)isAudioAuthorization
{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if([audioSession respondsToSelector:@selector(requestRecordPermission:)])
    {
        [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted)
         {
             if(granted)
                 return YES;
             else
                 return NO;
         }];
   
     }
    return YES;
}


@end

