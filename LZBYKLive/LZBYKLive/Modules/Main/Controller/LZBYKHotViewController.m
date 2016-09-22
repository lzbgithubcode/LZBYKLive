//
//  LZBYKHotViewController.m
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKHotViewController.h"
#import "LZBYKMainHttpDM.h"
#import "LZBMainLiveModel.h"
#import "LZBInifiteScrollView.h"

#define scrollView_Height  125

static NSString *liveCellID = @"liveCellID";
@interface LZBYKHotViewController()
@property (nonatomic, strong) NSMutableArray <LZBMainLiveModel*>*data;

@property (nonatomic, strong) LZBInifiteScrollView *headScrollView;
@property (nonatomic, strong) NSArray *images;

@end

@implementation LZBYKHotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headScrollView;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:liveCellID];
    [self loadDowndata];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:liveCellID];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个cell",indexPath.row];
    return cell;
}

#pragma mark - 数据
- (void)loadDowndata
{
    LZBWeakSelf(weakSelf);
  [[LZBYKMainHttpDM shareInstance] getMainHotListsucessResponse:^(LZBYKMainListResponseModel *response) {
      [weakSelf processNetWorkDataWithResponse:response];
  } failResponse:^(NSError *error) {
      
  }];
}

- (void)processNetWorkDataWithResponse:(LZBYKMainListResponseModel *)response
{
    [self.tableView.mj_header endRefreshing];
    [self.data addObjectsFromArray:response.lives];
    [self.tableView reloadData];
}

#pragma mark - set/get
- (NSMutableArray<LZBMainLiveModel *> *)data
{
    if(_data ==nil)
    {
        _data = [NSMutableArray array];
    }
    return _data;
}

- (LZBInifiteScrollView *)headScrollView
{
  if(_headScrollView == nil)
  {
      _headScrollView = [[LZBInifiteScrollView alloc]init];
      _headScrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, scrollView_Height);
      _headScrollView.placeholder = [UIImage imageNamed:@"default_ticker"];
      _headScrollView.images = self.images;
      [_headScrollView setpageControlCurrentColor:[UIConstantColor getNaviBlueColor] OtherColor:[UIColor colorWithWhite:0.8 alpha:0.5]];
  }
    return _headScrollView;
}

- (NSArray *)images
{
  if(_images == nil)
  {
      _images = @[[NSURL URLWithString:[UIConstant httpImage_getImageNameString:@"2FNzM4OTExNDc0NDYyOTA5.jpg" withSize:CGSizeMake(640, 213)]],
                  [NSURL URLWithString:[UIConstant httpImage_getImageNameString:@"2FNTAyNDMxNDc0MzY1OTg0.jpg" withSize:CGSizeMake(640, 213)]],
                  [NSURL URLWithString:[UIConstant httpImage_getImageNameString:@"2FODUxMzQxNDc0NDYwNzYy.jpg" withSize:CGSizeMake(640, 213)]]];
  }
    return _images;
}
@end
