//
//  LZBYKMainBaseVC.m
//  LZBYKLive
//
//  Created by zibin on 16/9/21.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKMainBaseVC.h"

@interface LZBYKMainBaseVC ()

@end

@implementation LZBYKMainBaseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
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

- (void)loadDowndata
{

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
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
@end
