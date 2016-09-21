//
//  LZBYKHotViewController.m
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKHotViewController.h"
#import "LZBYKMainHttpDM.h"

@implementation LZBYKHotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self loadDowndata];
}

- (void)loadDowndata
{
  [[LZBYKMainHttpDM shareInstance] getMainHotListsucessResponse:^(id response) {
      
  } failResponse:^(NSError *error) {
      
  }];
}
@end
