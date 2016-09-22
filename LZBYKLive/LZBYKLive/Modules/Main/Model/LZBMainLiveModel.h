//
//  LZBMainLiveModel.h
//  LZBYKLive
//
//  Created by zibin on 16/9/21.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseModel.h"
#import "LZBYKCreatorModel.h"

@interface LZBMainLiveModel : BaseModel
@property (nonatomic, strong)  NSString *city;
@property (nonatomic, strong) LZBYKCreatorModel *creator;
@property (nonatomic, assign)  NSInteger online_users;
@property (nonatomic, strong) NSString *stream_addr;
@property (nonatomic, strong) NSString *distance;
@end
