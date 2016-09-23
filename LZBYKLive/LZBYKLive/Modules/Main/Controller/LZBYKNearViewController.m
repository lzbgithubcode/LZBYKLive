//
//  LZBYKNearViewController.m
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKNearViewController.h"
#import "LZBYKMainNearCell.h"
#import "LZBYKMainNearHeadView.h"
#import "LZBYKGifHeader.h"
#import "LZBYKMainHttpDM.h"

static   NSString *LZBYKMainNearCellID = @"LZBYKMainNearCellID";
static   NSString *LZBYKMainNearHeadViewID = @"LZBYKMainNearHeadViewID";

@interface LZBYKNearViewController()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSMutableArray<LZBYKMainNearCellModel *> *datas;

@end

@implementation LZBYKNearViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[LZBYKMainNearCell class] forCellWithReuseIdentifier:LZBYKMainNearCellID];
    [self.collectionView registerClass:[LZBYKMainNearHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LZBYKMainNearHeadViewID];
    [self setupRefresh];
}

#pragma mark -data
- (void)setupRefresh
{
    LZBWeakSelf(weakSelf);
    LZBYKGifHeader *header = [LZBYKGifHeader headerWithRefreshingBlock:^{
        [weakSelf loadDowndata];
    }];
    self.collectionView.mj_header = header;
    [self loadDowndata];
}

- (void)loadDowndata
{
    LZBWeakSelf(weakSelf);
    [[LZBYKMainHttpDM shareInstance] getMainNearListsucessResponse:^(LZBYKNearResponseModel *response) {
        [weakSelf processNetWorkDataWithResponse:response];
    } failResponse:^(NSError *error) {
        [weakSelf.collectionView.mj_header endRefreshing];
    }];
}
- (void)processNetWorkDataWithResponse:(LZBYKNearResponseModel *)response
{
    [self.collectionView.mj_header endRefreshing];
    self.datas= [self convertFromNetWorkModelToCellModel:response.lives];
    [self.collectionView reloadData];
}

- (NSMutableArray <LZBYKMainNearCellModel *>*)convertFromNetWorkModelToCellModel:(NSArray <LZBMainLiveModel *>*)lives
{
    NSMutableArray *tempaArray = [NSMutableArray array];
    for (LZBMainLiveModel *object in lives) {
        LZBYKMainNearCellModel *model = [[LZBYKMainNearCellModel alloc]init];
        model.liver_count = [NSString stringWithFormat:@"%ld",object.creator.level];
        model.liver_distance = object.distance;
        model.liver_portrait = object.creator.portrait;
        model.liver_stream = object.stream_addr;
        [tempaArray addObject:model];
    }
    return tempaArray;
}



#pragma mark - collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LZBYKMainNearCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LZBYKMainNearCellID forIndexPath:indexPath];
    cell.cellModel = indexPath.row < self.datas.count ? self.datas[indexPath.row]: nil;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        LZBYKMainNearHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LZBYKMainNearHeadViewID forIndexPath:indexPath];
       reusableview = headerView;
    }
    return reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    LZBYKMainNearCellModel *model = self.datas[indexPath.row];
    CGFloat width = (LZBSCREEN__WIDTH - (default_EveryRow_Count+1) *default_Margin)/default_EveryRow_Count;
    return CGSizeMake(width, model.cellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0);
    [UIView animateWithDuration:1.0 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
    }];
}

#pragma mark - set/get
- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, LZBSCREEN__WIDTH, self.view.lzb_h -LZBSCREEN__NAVIBAR__TOTAL__HEIGHT) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if(_flowLayout == nil)
    {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.minimumLineSpacing = default_Margin;
        _flowLayout.minimumInteritemSpacing = default_Margin;
        _flowLayout.sectionInset = UIEdgeInsetsMake(default_Margin, default_Margin, default_Margin, default_Margin);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.headerReferenceSize = CGSizeMake(LZBSCREEN__WIDTH, 50 * get6sConstantHeightScale());
    }
    return _flowLayout;
}

- (NSMutableArray<LZBYKMainNearCellModel *> *)datas
{
  if(_datas == nil)
  {
      _datas = [NSMutableArray array];
  }
    return _datas;
}


@end
