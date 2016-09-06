//
//  LZBDataConversionManger.m
//  LZBYKLive
//
//  Created by zibin on 16/9/6.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBDataConversionManger.h"
#import <Mantle/Mantle.h>

static LZBDataConversionManger *_instance;
@implementation LZBDataConversionManger
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_instance == nil)
            _instance = [[LZBDataConversionManger alloc]init];
    });
    return _instance;
}


- (id)convertWithDictionary:(NSDictionary *)dict ToModel:(Class)modelClass
{
    if(dict == nil) return nil;
    NSError *error = nil;
    id model = [MTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:dict error:&error];
    if(!error) return model;
    else
    {
        LZBCustomLog(@"字典转模型失败%@",error);
        return nil;
    }
}

- (NSDictionary *)convertWithModelToDictionary:(id<MTLJSONSerializing>)model
{
    if(model == nil) return nil;
    NSError *err = nil;
    NSDictionary *dic = [MTLJSONAdapter JSONDictionaryFromModel:model error:&err];
    if (err) {
        LZBCustomLog(@"模型转字典失败%@",err);
        return nil;
    }
    return dic;
}

- (NSString *)convertWithModelToJSONString:(id<MTLJSONSerializing>)model
{
    if(model == nil) return @"";
    NSDictionary *dict = [self convertWithModelToDictionary:model];
    NSError *error = nil;
    NSData  *jsonData =[NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    if(error)
    {
        LZBCustomLog(@"模型转字典序列化失败%@",error);
        return nil;
    }
    else
        return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)convertWithJSONStringToJSON:(NSString *)JSONString
{
    if(JSONString == nil) return nil;
    NSData *jsonData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(error)
    {
        LZBCustomLog(@"字符串转字典反列化失败%@",error);
        return nil;
    }
    else
    {
        return dict;
    }
}

- (id)convertWithJSONString:(NSString *)JSONString ToModel:(Class)modelClass
{
    NSDictionary *dict = [self convertWithJSONStringToJSON:JSONString];
    return [self convertWithDictionary:dict ToModel:modelClass];
}

-(id)convertWithJSONArray:(NSArray *)JSONArray ToModelArray:(Class)modelClass
{
    if(JSONArray.count <= 0) return nil;
    NSMutableArray *objectArray = [NSMutableArray array];
    for (NSDictionary *dict in JSONArray) {
        id model = [self convertWithDictionary:dict ToModel:modelClass];
        [objectArray addObject:model];
    }
    return objectArray;
}


@end
