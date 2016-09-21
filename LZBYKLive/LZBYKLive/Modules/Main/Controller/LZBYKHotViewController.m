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


static NSString *liveCellID = @"liveCellID";
@interface LZBYKHotViewController()
@property (nonatomic, strong) NSMutableArray <LZBMainLiveModel*>*data;

@end

@implementation LZBYKHotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
@end
