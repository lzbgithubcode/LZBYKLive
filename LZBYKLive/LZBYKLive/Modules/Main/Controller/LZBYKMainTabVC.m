//
//  LZBYKMainTabVC.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainTabVC.h"
#import "LZBMyInterfaceDM.h"
#import "LZBCenterInterfaceDM.h"
#import "LZBYKMainInterfaceDM.h"
#import "BaseNC.h"

@interface LZBYKMainTabVC()

@end


@implementation LZBYKMainTabVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addChildViewControllers];
}

- (void)addChildViewControllers
{
    [self addChildViewController:[[BaseNC alloc]initWithRootViewController: [LZBYKMainInterfaceDM  m_instanceMainViewController]]];
    [self addChildViewController:[[BaseNC alloc]initWithRootViewController: [LZBCenterInterfaceDM  c_instanceCenterViewController]]];
    [self addChildViewController:[[BaseNC alloc]initWithRootViewController: [LZBMyInterfaceDM  m_instanceMyViewController]]];
}




@end
