//
//  LZBCommonMacros.h
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#ifndef LZBCommonMacros_h
#define LZBCommonMacros_h
// 弱引用
#define LZBWeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 日志输出
#ifdef DEBUG
#define LZBCustomLog(...) NSLog(__VA_ARGS__)
#else
#define LZBCustomLog(...)
#endif

//常用尺寸
#define LZBSCREEN__WIDTH  [UIScreen mainScreen].bounds.size.width
#define LZBSCREEN__HEIGHT  [UIScreen mainScreen].bounds.size.height
#define LZBSCREEN__NAVIBAR__TOTAL__HEIGHT 64
#define LZBSCREEN__NAVIBAR__STATUSBAR__HEIGHT 20
#define LZBSCREEN__NAVIBAR__HEIGHT 44
#define LZBSCREEN__TABBAR__HEIGHT 49


#endif 
