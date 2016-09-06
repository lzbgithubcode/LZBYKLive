//
//  BaseModel.h
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BaseModel : MTLModel<MTLJSONSerializing>

/**
 *  模型转化为字典
 */
- (NSDictionary *)modelToDictionary;


/**
 *  字典转化模型 （属性值一一对应）
 */
+ (NSDictionary *)JSONKeyPathsByPropertyKey;
@end
