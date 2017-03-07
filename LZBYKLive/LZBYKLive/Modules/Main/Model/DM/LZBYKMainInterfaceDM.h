//
//  LZBYKMainInterfaceDM.h
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseInterfaceDM.h"
#import "LZBYKMainTabVC.h"
#import "LZBYKMainViewController.h"
#import "LZBRecordVideoVC.h"

@interface LZBYKMainInterfaceDM : BaseInterfaceDM

/**
 *  跳转到根控制器的tabBar控制器
 */
+ (LZBYKMainTabVC *)instanceMainTabVC;

/**
 *  跳转到主控制器
 */
+ (LZBYKMainViewController *)m_instanceMainViewController;
/**
 *  跳转到录制视频
 */
+ (LZBRecordVideoVC *)m_instanceRecordVideoVC;
@end
