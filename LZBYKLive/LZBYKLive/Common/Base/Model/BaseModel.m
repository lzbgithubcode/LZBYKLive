//
//  BaseModel.m
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel
- (NSDictionary *)modelToDictionary
{
    return [MTLJSONAdapter JSONDictionaryFromModel:self error:nil];
}


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
     //获得模型的属性列表
    NSArray *property = [self getClassPropertyKeyWithClass:[self class]];
    
    //创建MATModel需要的字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    //自动包装成@"key": JSONDictionary[@"key"],
    for (NSString *key in property) {
        [dict setObject:key forKey:key];
    }
    return dict;
}

+ (NSArray *)getClassPropertyKeyWithClass:(Class)kTargetClass
{
    NSMutableArray *propsNameArray = [NSMutableArray array];
    while (kTargetClass != [BaseModel class])
    {
        unsigned count;
        objc_property_t *props = class_copyPropertyList(kTargetClass, &count);
        for (unsigned i = 0; i< count; i++)
        {
            const char *propertyName =property_getName(props[i]);
            //char 转化为NSstring
            NSString *name = [NSString stringWithUTF8String:propertyName];
            [propsNameArray addObject:name];
        }
        //C语言的东东，记得释放
        free(props);
        //类似递归的思想
        kTargetClass = [kTargetClass superclass];
    }
    return propsNameArray;
}

@end
