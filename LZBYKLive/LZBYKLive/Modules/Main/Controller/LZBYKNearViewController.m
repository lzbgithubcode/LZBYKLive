//
//  LZBYKNearViewController.m
//  LZBYKLive
//
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import "LZBYKNearViewController.h"
#import "LZBYKMainNearCell.h"

static   NSString *LZBYKMainNearCellID = @"LZBYKMainNearCellID";

@interface LZBYKNearViewController()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation LZBYKNearViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[LZBYKMainNearCell class] forCellWithReuseIdentifier:LZBYKMainNearCellID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LZBYKMainNearCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LZBYKMainNearCellID forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
//        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
//        NSString *title = [[NSString alloc] initWithFormat:@"Recipe Group #%i",indexPath.section +1];
//        
//        headerView.title.text = title;
//        
//        UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
//        
//        headerView.backgroundImage.image = headerImage;
//        
//        reusableView = headerView;
        

    }
    return reusableview;
}

#pragma mark - set/get
- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, LZBSCREEN__WIDTH, self.view.lzb_h -LZBSCREEN__NAVIBAR__TOTAL__HEIGHT) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor grayColor];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if(_flowLayout == nil)
    {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.minimumLineSpacing = 5;
        _flowLayout.minimumInteritemSpacing = 5;
        _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}

- (NSMutableArray *)datas
{
  if(_datas == nil)
  {
      _datas = [NSMutableArray array];
  }
    return _datas;
}


@end
