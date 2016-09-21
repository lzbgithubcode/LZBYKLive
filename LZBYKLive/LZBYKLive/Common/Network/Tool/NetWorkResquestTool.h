//
//  NetWorkResquestTool.h
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResquestModel.h"
#import "BaseResponseModel.h"

//数据解析类型
typedef NS_ENUM(NSInteger,NetWorkResponseDataType)
{
   NetWorkResponseDataType_JSON = 1,  //JSON类型解析
   NetWorkResponseDataType_XML = 2,   //XML类型解析
   NetWorkResponseDataType_Default = NetWorkResponseDataType_JSON,
};

//结果block
typedef void(^sucessResponseBlock)(id response);
typedef void(^failResponseBlock)(NSError *error);


@interface NetWorkResquestTool : NSObject

/**
 *  请求超时时间,默认10s
 */
@property (nonatomic, assign) NSTimeInterval timeOut;

/**
 *  响应回调队列,默认主队列
 */
@property (nonatomic, strong) dispatch_queue_t responseQueue;

/**
 *  解析的数据类型，默认是NetWorkResponseDataType_Default
 */
@property (nonatomic, assign) NetWorkResponseDataType responseDataType;

/**
 *  统一的默认请求头字典
 */
@property (nonatomic, strong) NSMutableDictionary *resquestDefaultHeadDict;

/**
 *  请求参数模型
 */
@property (nonatomic, strong,readonly) BaseResquestModel *resquestModel;

/**
 *  请求响应模型
 */
@property (nonatomic, strong,readonly) BaseResponseModel *responseModel;

#pragma mark - method
/**
 *  get请求
 *
 *  @param requestModel  请求模型
 *  @param responseModel 响应模型
 *  @param sucessBlock   请求成功回调
 *  @param failBlock     请求失败回调
 *
 *  @return
 */
- (NSURLSessionDataTask *)httpGetWithModel:(BaseResquestModel *)requestModel
                             ResponseClass:(Class)responseClass
                            sucessResponse:(sucessResponseBlock)sucessBlock
                              failResponse:(failResponseBlock)failBlock;


/**
 *  Post请求
 *
 *  @param requestModel  请求模型
 *  @param responseModel 响应模型
 *  @param sucessBlock   请求成功回调
 *  @param failBlock     请求失败回调
 *
 *  @return
 */
- (NSURLSessionDataTask *)httpPostWithModel:(BaseResquestModel *)requestModel
                             ResponseClass:(Class)responseClass
                            sucessResponse:(sucessResponseBlock)sucessBlock
                              failResponse:(failResponseBlock)failBlock;

@end
