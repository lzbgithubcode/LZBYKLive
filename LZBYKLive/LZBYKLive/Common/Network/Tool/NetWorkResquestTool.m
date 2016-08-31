//
//  NetWorkResquestTool.m
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "NetWorkResquestTool.h"
#import <AFNetworking/AFHTTPSessionManager.h>

//响应接受类型
#define kResponseAcceptableContentTypes   [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"charset=utf-8", nil]

static AFHTTPSessionManager *_resquestManger;
@interface NetWorkResquestTool()

@property (nonatomic, strong) Class responseClass;
@end

@implementation NetWorkResquestTool

+ (AFHTTPSessionManager *)shareResquestManger
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(_resquestManger == nil)
            _resquestManger = [AFHTTPSessionManager manager];
    });
    _resquestManger.requestSerializer = [AFHTTPRequestSerializer serializer];
    _resquestManger.responseSerializer = [AFHTTPResponseSerializer serializer];
    _resquestManger.responseSerializer.acceptableContentTypes = kResponseAcceptableContentTypes;
    return _resquestManger;
}

- (instancetype)init
{
  if(self = [super init])
  {
      //设置默认值
      self.timeOut = 10.0;
      self.responseQueue = dispatch_get_main_queue();
      self.responseDataType = NetWorkResponseDataType_Default;
  }
    return self;
}

#pragma mark - 网络请求
- (NSURLSessionDataTask *)httpGetWithModel:(BaseResquestModel *)requestModel
                             ResponseModel:(BaseResponseModel *)responseModel
                            sucessResponse:(sucessResponseBlock)sucessBlock
                              failResponse:(failResponseBlock)failBlock
{
    [self resquestProcess:requestModel responseProcess:responseModel];
    
    return [self baseGetHttpWithURL:requestModel.url parameters:[requestModel modelToBaseResquestModel] sucessResponse:sucessBlock failResponse:failBlock];
}

- (NSURLSessionDataTask *)httpPostWithModel:(BaseResquestModel *)requestModel
                              ResponseModel:(BaseResponseModel *)responseModel
                             sucessResponse:(sucessResponseBlock)sucessBlock
                               failResponse:(failResponseBlock)failBlock
{
   [self resquestProcess:requestModel responseProcess:responseModel];
    return [self basePostHttpWithURL:[requestModel url] parameters:[requestModel modelToBaseResquestModel] sucessResponse:sucessBlock failResponse:failBlock];
}

- (void)resquestProcess:(BaseResquestModel *)requestModel responseProcess:(BaseResponseModel *)responseModel
{
    _resquestModel = requestModel;
    _responseModel = responseModel;
}

#pragma mark - 基础网络请求
/**
 *  get-基本网络请求
 *
 *  @param url         请求地址
 *  @param paramDicts  请求参数
 *  @param sucessBlock 请求成功
 *  @param failBlock   请求失败
 *
 *  @return
 */
- (NSURLSessionDataTask *)baseGetHttpWithURL:(NSString *)url
                                  parameters:(NSDictionary *)paramDicts
                              sucessResponse:(sucessResponseBlock)sucessBlock
                                failResponse:(failResponseBlock)failBlock{
    
  AFHTTPSessionManager *httpManger = [self configHttpBaseInfoWithURL:url withParamsDict:paramDicts httpType:@"get请求方式"];
    LZBWeakSelf(ws);
    NSURLSessionDataTask *task = [httpManger GET:url parameters:paramDicts success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [ws resultProcess:responseObject error:nil sucessResponse:sucessBlock failResponse:failBlock];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [ws resultProcess:nil error:error sucessResponse:sucessBlock failResponse:failBlock];
    }];
    return task;
}

/**
 *  post-基本网络请求
 *
 *  @param url         请求地址
 *  @param paramDicts  请求参数
 *  @param sucessBlock 请求成功
 *  @param failBlock   请求失败
 *
 *  @return
 */
- (NSURLSessionDataTask *)basePostHttpWithURL:(NSString *)url
                                  parameters:(NSDictionary *)paramDicts
                              sucessResponse:(sucessResponseBlock)sucessBlock
                                failResponse:(failResponseBlock)failBlock
{
     AFHTTPSessionManager *httpManger = [self configHttpBaseInfoWithURL:url withParamsDict:paramDicts httpType:@"post请求方式"];
    LZBWeakSelf(ws);
    NSURLSessionDataTask *task = [httpManger POST:url parameters:paramDicts success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [ws resultProcess:responseObject error:nil sucessResponse:sucessBlock failResponse:failBlock];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [ws resultProcess:nil error:error sucessResponse:sucessBlock failResponse:failBlock];
    }];
    return task;
}

- (AFHTTPSessionManager *)configHttpBaseInfoWithURL:(NSString *)url withParamsDict:(NSDictionary *)paramDicts  httpType:(NSString *)typeSting
{
    //检测URL
    url = [self checkResquestURLWithURL:url];
    NSLog(@"request:\n[\n requestType:%@\n  url:%@\n  params:%@\n]",typeSting,url,paramDicts);
    
    //设置请求基本信息
    AFHTTPSessionManager *httpManger = [NetWorkResquestTool shareResquestManger];
    if(![self.responseQueue isEqual:dispatch_get_main_queue()])
        httpManger.completionQueue = self.responseQueue;
    httpManger.requestSerializer.timeoutInterval = self.timeOut;
    //增加请求头
    [self addResquestHeadDictionary:self.resquestDefaultHeadDict WithRequestSerializer:httpManger.requestSerializer];
    
    return httpManger;
}

#pragma mark- 请求结果处理
- (void)resultProcess:(id)responseDict
                error:(NSError *)error
       sucessResponse:(sucessResponseBlock)sucessBlock
         failResponse:(failResponseBlock)failBlock
{
   if(error == nil)
   {
       if(responseDict == nil)
       {
           LZBCustomLog(@"网络请求结果为:%@",responseDict);
           return;
       }
       _responseModel = [MTLJSONAdapter modelOfClass:self.responseClass fromJSONDictionary:responseDict error:nil];
       if(_responseModel == nil)
       {
           LZBCustomLog(@"\n序列化失败：%@",_responseModel);
           return;
       }
       if(sucessBlock != nil)
       {
          dispatch_async(self.responseQueue, ^{
              sucessBlock(_responseModel);
          });
       }
   }
   else
   {
       if(failBlock != nil)
       {
           dispatch_async(self.responseQueue, ^{
               failBlock(error);
           });
       }
           
   }
}


#pragma mark - 请求参数配置
- (void)addResquestHeadDictionary:(NSDictionary *)headDict WithRequestSerializer:(AFHTTPRequestSerializer *)requestSerializer
{
    [headDict enumerateKeysAndObjectsUsingBlock:^(NSString  *key, NSString  *obj, BOOL * _Nonnull stop) {
        if(key.length == 0 || obj.length == 0) *stop = YES;
        [requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
}

- (NSString *)checkResquestURLWithURL:(NSString *)url
{
   if(url == nil)
   {
       NSLog(@"URL为空");
       return @"htttp://www.baidu.com";
   }
   else
   {
      if(isContainChinese(url))
      {
          url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
      }
       return url;
   }
}

#pragma mark - set/get
 - (NSMutableDictionary *)resquestDefaultHeadDict
{
    if(_resquestDefaultHeadDict == nil)
    {
        _resquestDefaultHeadDict = [NSMutableDictionary dictionary];
    }
    return _resquestDefaultHeadDict;
}

- (Class)responseClass
{
  if(_responseClass == nil)
  {
      _responseClass = [BaseResponseModel class];
  }
    return _responseClass;
}


@end
