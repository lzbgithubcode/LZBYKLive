//
//  LZBYKMainInterfaceDM.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainInterfaceDM.h"


@implementation LZBYKMainInterfaceDM

+ (LZBYKMainTabVC *)instanceMainTabVC
{
    return [[LZBYKMainTabVC alloc]init];
}

+ (LZBYKMainViewController *)m_instanceMainViewController
{
    return [[LZBYKMainViewController alloc]init];
}
+ (LZBRecordVideoVC *)m_instanceRecordVideoVC
{
    return [[LZBRecordVideoVC alloc]init];
}
@end
