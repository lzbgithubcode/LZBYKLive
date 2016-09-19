//
//  LZBYKSlideStyleModel.h
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZBYKSlideStyleModel : NSObject

@property (nonatomic, strong) NSArray <NSString *>*tiltes;

@property (nonatomic, strong) UIFont *normalFont;

@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIColor *selectColor;

@property (nonatomic, assign) CGFloat titleScale;
@end
