//
//  BaseResquestModel.h
//  LZBYKLive
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseModel.h"
#import "BaseHttpModel.h"
#import "BaseResponseModel.h"

@interface BaseResquestModel : BaseModel

/**
 *  服务器需求地址url
 */
- (NSString *)url;

/**
 *  网络请求模型参数转化为字典参数
 */
- (NSDictionary *)modelToBaseResquestModel;
@end
