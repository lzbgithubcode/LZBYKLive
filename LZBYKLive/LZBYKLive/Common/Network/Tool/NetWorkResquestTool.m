//
//  NetWorkResquestTool.m
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "NetWorkResquestTool.h"
#import <AFNetworking/AFHTTPSessionManager.h>

static AFHTTPSessionManager *_resquestManger;

//响应接受类型
#define kResponseAcceptableContentTypes   [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"charset=utf-8", nil]
@interface NetWorkResquestTool()

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

#pragma mark - 基本网络请求
/**
 *  基本网络请求
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
                                failResponse:(failResponseBlock)failBlock
{
     //检测URL
    url = [self checkResquestURLWithURL:url];
    NSURLSessionDataTask *task = nil;
    return task;
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
@end
