//
//  LZBYKCreatorModel.h
//  LZBYKLive
//
//  Created by zibin on 16/9/21.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseModel.h"

@interface LZBYKCreatorModel : BaseModel
@property (nonatomic, strong) NSString *birth;
@property (nonatomic, strong) NSString *emotion;
@property (nonatomic, strong) NSString *nick;
@property (nonatomic, strong) NSString *portrait;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger level;
@end
