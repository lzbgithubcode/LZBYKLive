//
//  BaseDataManger.m
//  LZBYKLive
//
//  Created by zibin on 16/8/31.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "BaseDataManger.h"
#import <objc/runtime.h>

static NSMutableDictionary *_instanceDictionary;

@interface BaseDataManger()

@property (nonatomic, strong) NSHashTable *delegates;
@end

@implementation BaseDataManger
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!_instanceDictionary)
        _instanceDictionary = [NSMutableDictionary dictionary];
    });
    NSString *key = NSStringFromClass([self class]);
    id  valueObject = [_instanceDictionary valueForKey:key];
    if(valueObject == nil)
    {
        valueObject = [self new];
        [_instanceDictionary setValue:valueObject forKey:key];
    }
    return valueObject;
}

+ (void)removeInstance
{
    NSString *key = NSStringFromClass([self class]);
    [_instanceDictionary removeObjectForKey:key];
}

- (void)addDelegateObject:(id)delegate
{
    [self.delegates addObject:delegate];
}

- (void)removeDelegateObject:(id)delegate
{
    [self.delegates removeObject:delegate];
}

//代理回调
- (void)delegateCallBack:(NSHashTable *)delegates callSelector:(SEL)aSelector withObject:(id)anArgument withAnotherObject:(id)anotherAnArgument
{
    for (id delegate in delegates)
    {
        if([delegate respondsToSelector:aSelector])
        {
            [delegate performSelector:aSelector withObject:anArgument withObject:anotherAnArgument];
             break;
        }
      
    }
}

- (void)delegateDataMangerCallBackSelector:(SEL)aSelector withObject:(id)anArgument withAnotherObject:(id)anotherAnArgument
{
    [self delegateCallBack:self.delegates callSelector:aSelector withObject:anArgument withAnotherObject:anotherAnArgument];
}



#pragma mark - set/get
- (NSHashTable *)delegates
{
   if(_delegates == nil)
   {
       _delegates = [NSHashTable weakObjectsHashTable];
   }
    return _delegates;
}
@end
