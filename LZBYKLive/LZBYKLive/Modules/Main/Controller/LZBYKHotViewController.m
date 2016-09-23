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
#import "LZBYKMainHotCell.h"
#import "LZBYKGifHeader.h"

#define scrollView_Height  125

static NSString *LZBYKMainHotCellID = @"LZBYKMainHotCellID";

@interface LZBYKHotViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray <LZBYKMainHotCellModel*>*data;

@property (nonatomic, strong) LZBInifiteScrollView *headScrollView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *images;

@end

@implementation LZBYKHotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headScrollView;
    [self.tableView registerClass:[LZBYKMainHotCell class] forCellReuseIdentifier:LZBYKMainHotCellID];
    [self loadDowndata];
    [self setupRefresh];
}

- (void)setupRefresh
{
    LZBWeakSelf(weakSelf);
    LZBYKGifHeader *header = [LZBYKGifHeader headerWithRefreshingBlock:^{
        [weakSelf loadDowndata];
    }];
    self.tableView.mj_header = header;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZBYKMainHotCell *cell = [tableView dequeueReusableCellWithIdentifier:LZBYKMainHotCellID];
    cell.cellModel = (indexPath.row < self.data.count)?self.data[indexPath.row]:nil;
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   //动画效果
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row < self.data.count)
        return self.data[indexPath.row].cellHeight;
    else
        return CGFLOAT_MIN;
}

#pragma mark - 数据
- (void)loadDowndata
{
    LZBWeakSelf(weakSelf);
  [[LZBYKMainHttpDM shareInstance] getMainHotListsucessResponse:^(LZBYKMainListResponseModel *response) {
      [weakSelf processNetWorkDataWithResponse:response];
  } failResponse:^(NSError *error) {
     [weakSelf.tableView.mj_header endRefreshing];
  }];
}

- (void)processNetWorkDataWithResponse:(LZBYKMainListResponseModel *)response
{
    [self.tableView.mj_header endRefreshing];
    self.data= [self convertFromNetWorkModelToCellModel:response.lives];
    [self.tableView reloadData];
}

- (NSMutableArray <LZBYKMainHotCellModel *>*)convertFromNetWorkModelToCellModel:(NSArray <LZBMainLiveModel *>*)lives
{
    NSMutableArray *tempaArray = [NSMutableArray array];
    for (LZBMainLiveModel *object in lives) {
        LZBYKMainHotCellModel *model = [[LZBYKMainHotCellModel alloc]init];
        model.liver_city = object.city;
        model.liver_name = object.creator.nick;
        model.liver_portrait = object.creator.portrait;
        model.audience_count = [NSString stringWithFormat:@"%ld人",object.online_users];
        model.liver_stream = object.stream_addr;
        [tempaArray addObject:model];
    }
    return tempaArray;
}

#pragma mark - set/get
- (NSMutableArray<LZBYKMainHotCellModel *> *)data
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

#pragma mark - set/get
- (UITableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LZBSCREEN__WIDTH, self.view.lzb_h -LZBSCREEN__NAVIBAR__TOTAL__HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
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
