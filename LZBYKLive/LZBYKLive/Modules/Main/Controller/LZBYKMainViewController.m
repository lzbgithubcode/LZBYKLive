//
//  LZBYKMainViewController.m
//  LZBYKLive
//
//  Created by zibin on 16/9/13.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainViewController.h"
#import "LZBYKMainSlideView.h"
#import "LZBYKAttentionViewController.h"
#import "LZBYKHotViewController.h"
#import "LZBYKNearViewController.h"

@interface LZBYKMainViewController()<UIScrollViewDelegate>

@property (nonatomic, strong) LZBYKMainSlideView *slideView;

@property (nonatomic, strong) LZBYKSlideStyleModel *slideModel;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray<UIViewController*> *childVCs;

//data
@property (nonatomic, assign) CGFloat oldOffsetX,oldIndex,currentIndex;
@end

@implementation LZBYKMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavi];
    [self setupContentView];
    
}

- (void)setupNavi
{
    self.isShowCustomBar = YES;
    self.naviBarContentView.backgroundColor = [UIConstantColor getNaviBlueColor];
    self.statusStyle = UIStatusBarStyleLightContent;
    [self setLeftButtonImage:[UIImage imageNamed:@"searchbar_search"]];
    [self setRightButtonImage:[UIImage imageNamed:@"searchbar_search"]];
    LZBWeakSelf(weakSelf);
    [self.slideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.baseLeftButton.mas_right).offset(45);
        make.right.equalTo(weakSelf.baseRightButton.mas_left).offset(-45);
        make.centerX.equalTo(weakSelf.naviBarContentView);
        make.centerY.equalTo(weakSelf.baseLeftButton);
        make.height.mas_equalTo(LZBSCREEN__NAVIBAR__HEIGHT);
    }];
}
- (void)setupContentView
{
   LZBWeakSelf(weakSelf);
  [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.size.equalTo(weakSelf.baseContentView);
      make.center.equalTo(weakSelf.baseContentView);
  }];
  //布局子控件
    for (NSInteger i = 0; i < self.childViewControllers.count; i++)
    {
        UIViewController *vc = self.childViewControllers[i];
        CGFloat childVCX = i * LZBSCREEN__WIDTH;
        CGFloat childVCY = 0;
        CGFloat childVCW = LZBSCREEN__WIDTH;
        CGFloat childVCH = self.baseContentView.lzb_h;
        vc.view.frame = CGRectMake(childVCX, childVCY, childVCW, childVCH);
    }
    self.scrollView.contentSize = CGSizeMake(LZBSCREEN__WIDTH * self.childViewControllers.count, 0);
  
}


#pragma mark- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x > 0)
    {
        NSInteger index = scrollView.contentOffset.x/LZBSCREEN__WIDTH;
        CGFloat currentOffsetX = scrollView.contentOffset.x;
        CGFloat process = currentOffsetX/LZBSCREEN__WIDTH -floor(index);
        if(currentOffsetX - self.oldOffsetX>=0)
        {
            if(process == 0) return;
            self.oldIndex = index;
            self.currentIndex = self.oldIndex + 1;
            if(self.currentIndex >= self.childVCs.count)
            {
                self.currentIndex = self.childVCs.count - 1;
                return;
            }
        }
        else
        {
            self.currentIndex = index;
            self.oldIndex = self.currentIndex + 1;
            if(self.oldIndex >= self.childVCs.count)
            {
                self.oldIndex = self.childVCs.count - 1;
                return;
            }
            process = 1.0-process;
        }
        
        [self.slideView reloadSegmentViewUIWithProgress:process currentIndex:self.currentIndex oldIndex:self.oldIndex];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.oldOffsetX = scrollView.contentOffset.x;
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSInteger currentIndex = scrollView.contentOffset.x / self.scrollView.bounds.size.width;
//   [self.slideView reloadSegmentViewUIWithProgress:1.0 currentIndex:currentIndex oldIndex:currentIndex];
//  
//}

#pragma mark - set/get
- (LZBYKSlideStyleModel *)slideModel
{
  if(_slideModel == nil)
  {
      _slideModel = [[LZBYKSlideStyleModel alloc]init];
      for (UIViewController *vc in self.childVCs) {
          [_slideModel.tiltes addObject:vc.title];
      }
      _slideModel.normalFont = [UIConstantFont getFontW3_H11];
      _slideModel.normalColor = [UIConstantColor getWordColorC5];
      _slideModel.selectColor = [UIColor redColor];
      _slideModel.titleScale = 1.3;
  }
    return _slideModel;
}

- (LZBYKMainSlideView *)slideView
{
  if(_slideView == nil)
  {
      LZBWeakSelf(weakSelf);
      _slideView = [[LZBYKMainSlideView alloc]initWithSlideStyleModel:self.slideModel selectHandle:^(LZBYKMainSlideViewType type) {
        [weakSelf.scrollView setContentOffset:CGPointMake(LZBSCREEN__WIDTH * type, 0) animated:YES];
      }];
      [self.naviBarContentView addSubview:_slideView];
  }
    return _slideView;
}

- (UIScrollView *)scrollView
{
  if(_scrollView == nil)
  {
      _scrollView = [[UIScrollView alloc]init];
      _scrollView.pagingEnabled = YES;
      _scrollView.showsHorizontalScrollIndicator = NO;
      _scrollView.delegate = self;
      [self.baseContentView addSubview:_scrollView];
  }
    return _scrollView;
}

- (NSMutableArray *)childVCs
{
  if(_childVCs == nil)
  {
      _childVCs = [NSMutableArray array];
      [self addChildVC:[[LZBYKAttentionViewController alloc]init] withTitle:@"关注" withMutabeArray:_childVCs];
      [self addChildVC:[[LZBYKHotViewController alloc]init] withTitle:@"热门" withMutabeArray:_childVCs];
      [self addChildVC:[[LZBYKNearViewController alloc]init] withTitle:@"附近" withMutabeArray:_childVCs];
  }
    return _childVCs;
}

- (void)addChildVC:(UIViewController *)childVC withTitle:(NSString *)title withMutabeArray:(NSMutableArray *)childVCs
{
    childVC.title =title;
    [childVCs addObject:childVC];
    [self addChildViewController:childVC];
    [self.scrollView addSubview:childVC.view];
    
}

@end
