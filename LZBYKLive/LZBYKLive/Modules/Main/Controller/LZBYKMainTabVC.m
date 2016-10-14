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
#import "UIDevice+Extension.h"
#import "LZBYKTabBar.h"
#import "LZBCenterChooseView.h"


@interface LZBYKMainTabVC()

@property (nonatomic, strong) LZBYKTabBar *customTabBar;
@end


@implementation LZBYKMainTabVC

- (void)viewDidLoad
{
    [super viewDidLoad];
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

- (void)gotoCenterViewControllerWithStartLive
{
    LZBWeakSelf(weakSelf);
    LZBCenterChooseView *chooseView = [LZBCenterChooseView show];
    [chooseView setChooseTypeBlock:^(LZBCenterChooseViewType type) {
       if(type ==LZBCenterChooseViewType_Live)
           [weakSelf gotoLiveViewController];
       else
           [weakSelf gotoShortVedioViewController];
    }];
    
}

- (void)gotoLiveViewController
{
    if([self checkVailableCenterViewController])
       [self presentViewController:[LZBCenterInterfaceDM c_instanceCenterViewController]
                          animated:YES
                        completion:nil];
}

- (void)gotoShortVedioViewController
{
   NSLog(@"当前调用的方法:%s------行号:line-%d ",__func__, __LINE__);
}


- (BOOL)checkVailableCenterViewController
{
    //判断模拟器
    if([UIConstant isSimulator])
    {
        [HUD  showNormalMessage:@"当前设备是模拟器，\n暂时不支持直播测试"];
        return NO;
    }
    //判断摄像头是否可用
    if(![UIConstant isValidateCamera])
    {
        [HUD  showNormalMessage:@"当前设备是摄像头不可用，\n请确认摄像头是否打开"];
        return NO;
    }
    //获取摄像头权限
    if(![UIConstant isCameraAuthorization])
    {
       [HUD  showNormalMessage:@"子彬直播需要访问您的摄像头。\n请启用摄像头-设置/隐私/摄像头"];
        return NO;
    }

    //获取麦克风权限
    if(![UIConstant isAudioAuthorization])
    {
        [HUD  showNormalMessage:@"app需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风"];
        return NO;
    }
    
    return YES;
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
