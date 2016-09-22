//
//  LZBYKMainListResquestModel.m
//  LZBYKLive
//
//  Created by zibin on 16/9/20.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainListResquestModel.h"

@implementation LZBYKMainListResquestModel
- (NSString *)url
{
  return kDefaultAPI_Main(@"&devi=e8a317dd6c9020ffaee45ae680989791355f0d9d&cv=IK3.5.10_Iphone&ua=iPhone6_2&proto=7&lc=0000000000000035&idfv=E00F9A8A-1FB6-40C5-A6BA-F8402ADF0761&imsi=&imei=&cc=TG0001&osversion=ios_9.300000&idfa=C020B5DA-EADA-4CC1-93DC-D4D7FDFC0216&uid=112732552&sid=20jps6SWcUPJ9h91YSX8dqMkZpXp06t0gCYnAgKG5KUkrZi1OFA&conn=Wifi&mtid=2e5ac89b161fff9ac9314de83df8a695&mtxid=8a25939264bd&code1965803151=1&tg=C020B5DA-EADA-4CC1-93DC-D4D7FDFC0216");
}
@end


@implementation LZBYKMainListResponseModel
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if([key isEqualToString:@"lives"])
    {
        return [MTLJSONAdapter arrayTransformerWithModelClass:[LZBMainLiveModel class]];
    }
    return nil;
}
@end
