//
//  LZBYKMainHttpDM.m
//  LZBYKLive
//
//  Created by zibin on 16/9/21.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainHttpDM.h"

@implementation LZBYKMainHttpDM

- (NSURLSessionDataTask *)getMainHotListsucessResponse:(void (^)(LZBYKMainListResponseModel *response))sucessBlock
                                          failResponse:(failResponseBlock)failBlock;
{
    LZBYKMainListResquestModel *requestModel = [[LZBYKMainListResquestModel alloc]init];
    return [self sendGetWithModel:requestModel ResponseClass:[LZBYKMainListResponseModel class] sucessResponse:sucessBlock failResponse:failBlock];
}
@end
