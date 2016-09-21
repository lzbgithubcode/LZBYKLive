//
//  BaseHttpDataManger.m
//  LZBYKLive
//
//  Created by zibin on 16/9/1.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseHttpDataManger.h"

@implementation BaseHttpDataManger
- (NSURLSessionDataTask *)sendGetWithModel:(BaseResquestModel *)requestModel
                             ResponseClass:(Class)responseClass
                            sucessResponse:(sucessResponseBlock)sucessBlock
                              failResponse:(failResponseBlock)failBlock
{
    NetWorkResquestTool *requestTool = [[NetWorkResquestTool alloc]init];
    LZBWeakSelf(weakSelf);
    return [requestTool httpGetWithModel:requestModel ResponseClass:responseClass sucessResponse:^(id response) {
        [weakSelf callback:response error:nil sucess:sucessBlock fail:failBlock];
    } failResponse:^(NSError *error) {
        [weakSelf callback:nil error:error sucess:sucessBlock fail:failBlock];
    }];
}

//回调处理
- (void)callback:(id)data error:(NSError *)error sucess:(void(^)(id))sucess fail:(void(^)(NSError *error))fail
{
    if(error && fail)
    {
        fail(error);
    }
    else
    {
       if(sucess)
           sucess(data);
    }
}

@end
