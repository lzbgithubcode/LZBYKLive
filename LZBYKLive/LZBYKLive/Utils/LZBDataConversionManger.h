//
//  LZBDataConversionManger.h
//  LZBYKLive
//
//  Created by zibin on 16/9/6.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LZBDataConversionManger : NSObject

+ (instancetype)shareInstance;

/**
 *  字典转模型
 *
 *  @param dict       字典
 *  @param modelClass 模型类型
 *
 *  @return 模型
 */
- (id)convertWithDictionary:(NSDictionary *)dict ToModel:(Class)modelClass;

/**
 *  模型转字典
 *
 *  @param (id<MTLJSONSerializing>)model 模型
 *
 *  @return 字典
 */
- (NSDictionary *)convertWithModelToDictionary:(id<MTLJSONSerializing>)model;

/**
 *  模型转JSON字符串
 *
 *  @param (id<MTLJSONSerializing>)model 模型类型
 *
 *  @returnJSON字符串
 */
- (NSString *)convertWithModelToJSONString:(id<MTLJSONSerializing>)model;

/**
 *  JSON字符串转字典
 *
 *  @param JSONString JSON字符串
 *
 *  @return
 */
- (NSDictionary *)convertWithJSONStringToJSON:(NSString *)JSONString;


/**
 *  JSON字符串转模型
 *
 *  @param JSONString JSON字符串
 *  @param modelClass 模型类型
 *
 *  @return 模型
 */
- (id)convertWithJSONString:(NSString *)JSONString ToModel:(Class)modelClass;



/**
 *  JSON数组转化成模型数组
 *
 *  @param JSONArray  JSON数组
 *  @param modelClass 模型数组
 */
- (id)convertWithJSONArray:(NSArray *)JSONArray ToModelArray:(Class)modelClass;


@end
