//
//  YKAppCacheDataManger.m
//  LZBYKLive
//
//  Created by zibin on 16/9/2.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "YKAppCacheDataManger.h"

static YKAppCacheDataManger *_instance;
@implementation YKAppCacheDataManger

#pragma mark - 实例化
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[YKAppCacheDataManger alloc]init];
    });
    return _instance;
}

+ (instancetype)removeInstance
{
    _instance = nil;
    return _instance;
}
#pragma mark - SQL
- (void)sql_saveToDataBaseWithModel:(BaseDBModel *)model
{
    [model sql_saveToDataBase];
}

- (void)sql_deleteToDataBaseWithModel:(BaseDBModel *)model
{
    [model sql_deleteToDataBase];
}

- (void)sql_updateToDataBaseWithModel:(BaseDBModel *)model
{
    [model sql_updateToDataBase];
}



#pragma mark - cache
- (void)saveObject:(NSObject *)object forKey:(NSString *)key
{
    if (object)
    {
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:object forKey:key];
        [def synchronize];
    }
}

- (void)removeForKey:(NSString *)key
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def removeObjectForKey:key];
    [def synchronize];
}

- (NSObject *)getObectForKey:(NSString *)key
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    return [def objectForKey:key];
}
@end
