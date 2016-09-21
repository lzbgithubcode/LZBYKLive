//
//  BaseHttpDataManger.h
//  LZBYKLive
//
//  Created by zibin on 16/9/1.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseDataManger.h"
#import "NetWorkResquestTool.h"

@interface BaseHttpDataManger : BaseDataManger

/**
 *  发送给请求
 *
 *  @param requestModel  请求模型
 *  @param responseModel 响应模型
 *  @param sucessBlock   成功
 *  @param failBlock     失败
 *
 *  @return 
 */
- (NSURLSessionDataTask *)sendGetWithModel:(BaseResquestModel *)requestModel
                             ResponseClass:(Class)responseClass
                            sucessResponse:(sucessResponseBlock)sucessBlock
                              failResponse:(failResponseBlock)failBlock;
@end
