//
//  BaseDataManger.h
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDataManger : NSObject

/**
 *  实例化-单例
 */
+ (instancetype)shareInstance;

/**
 *  移除清空实例
 */
+ (void)removeInstance;

/**
 *  增加代理监听对象
 */
- (void)addDelegateObject:(id)delegate;

/**
 *  移除代理监听对象
 */
- (void)removeDelegateObject:(id)delegate;


/**
 *  管理基类，代理回调
 *
 *  @param aSelector         代理回调方法
 *  @param anArgument        参数1
 *  @param anotherAnArgument 参数2
 */
- (void)delegateDataMangerCallBackSelector:(SEL)aSelector withObject:(id)anArgument withAnotherObject:(id)anotherAnArgument;

@end
