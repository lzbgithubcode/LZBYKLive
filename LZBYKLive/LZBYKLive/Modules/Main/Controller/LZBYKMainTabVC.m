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
#import "LZBYKTabBar.h"

@interface LZBYKMainTabVC()<UITabBarControllerDelegate>

@property (nonatomic, strong) LZBYKTabBar *customTabBar;
@end


@implementation LZBYKMainTabVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    [self addChildViewControllers];
}

- (void)addChildViewControllers
{
    [self addChildVC:[LZBYKMainInterfaceDM  m_instanceMainViewController] image:@"tab_live" selectImage:@"tab_live_p" title:nil];
    [self addChildVC:[LZBMyInterfaceDM  m_instanceMyViewController] image:@"tab_me" selectImage:@"tab_me_p" title:nil];
    
    [self setValue:self.customTabBar forKey:@"tabBar"];
    LZBWeakSelf(weakSelf);
    [self.customTabBar setTabBarCenterClickBlcok:^{
        [weakSelf gotoCenterViewControllerWithStartLive];
    }];
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)gotoCenterViewControllerWithStartLive
{
  
}

#pragma mark - set/get
- (void)addChildVC:(UIViewController *)childVC image:(NSString *)imageName selectImage:(NSString *)selctImageName title:(NSString *)title;
{
    childVC.title = title.length > 0 ? title :@"";
    childVC.tabBarItem.image =[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selctImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:[[BaseNC alloc]initWithRootViewController:childVC]];

}


- (LZBYKTabBar *)customTabBar
{
  if(_customTabBar == nil)
  {
      _customTabBar = [[LZBYKTabBar alloc]init];
  }
    return _customTabBar;
}




@end
