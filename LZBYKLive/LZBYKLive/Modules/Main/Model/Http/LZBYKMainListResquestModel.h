//
//  LZBYKMainListResquestModel.h
//  LZBYKLive
//
//  Created by zibin on 16/9/20.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseResquestModel.h"
#import "LZBMainLiveModel.h"

@interface LZBYKMainListResquestModel : BaseResquestModel

@end

@interface LZBYKMainListHttpModel : BaseHttpModel

@end

@interface LZBYKMainListResponseModel : BaseResponseModel
@property (nonatomic, assign) long expire_time;
@property (nonatomic, strong) NSArray <LZBMainLiveModel *>*lives;
@end
