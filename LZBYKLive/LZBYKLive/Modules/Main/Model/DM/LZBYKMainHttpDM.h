//
//  LZBYKMainHttpDM.h
//  LZBYKLive
//
//  Created by zibin on 16/9/21.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseHttpDataManger.h"
#import "LZBYKMainListResquestModel.h"
#import "LZBYKNearResqustModel.h"

@interface LZBYKMainHttpDM : BaseHttpDataManger

/**
 *  获得热门列表主页数据
 */
- (NSURLSessionDataTask *)getMainHotListsucessResponse:(void (^)(LZBYKMainListResponseModel *response))sucessBlock failResponse:(failResponseBlock)failBlock;

/**
 *  获得附近直播列表数据
 */
- (NSURLSessionDataTask *)getMainNearListsucessResponse:(void (^)(LZBYKNearResponseModel *response))sucessBlock failResponse:(failResponseBlock)failBlock;
@end
