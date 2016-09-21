//
//  config.h
//  LZBYKLive
//
//  Created by zibin on 16/9/20.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#ifndef config_h
#define config_h

//默认API
#define KSDefaultBase_URL  @"http://service.ingkee.com/"

#define kDefaultAPI_Main(api)   [NSString stringWithFormat:@"%@api/live/gettop?%@",KSDefaultBase_URL,api]

#endif /* config_h */
