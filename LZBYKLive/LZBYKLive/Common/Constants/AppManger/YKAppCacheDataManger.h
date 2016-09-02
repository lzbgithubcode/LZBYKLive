//
//  YKAppCacheDataManger.h
//  LZBYKLive
//
//  Created by zibin on 16/9/2.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseDBModel.h"

@interface YKAppCacheDataManger : BaseDBModel
#pragma mark - 实例化
+ (instancetype)shareInstance;

+ (instancetype)removeInstance;

#pragma mark - SQL
/**
 *  保存模型到数据库
 */
- (void)sql_saveToDataBaseWithModel:(BaseDBModel *)model;

/**
 *  删除模型到数据库
 */
- (void)sql_deleteToDataBaseWithModel:(BaseDBModel *)model;;

/**
 *  更新模型到数据库
 */
- (void)sql_updateToDataBaseWithModel:(BaseDBModel *)model;;


#pragma mark- Cache
/**
 *  保存数据到沙河中NSUserDefaults
 */
- (void)saveObject:(NSObject *)object forKey:(NSString *)key;

/**
 *  通过key移除数据
 */
- (void)removeForKey:(NSString *)key;

/**
 *  通过key值获得数据
 */
- (NSObject *)getObectForKey:(NSString *)key;

@end
