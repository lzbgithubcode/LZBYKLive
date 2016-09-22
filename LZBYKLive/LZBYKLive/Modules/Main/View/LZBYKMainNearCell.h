//
//  LZBYKMainNearCell.h
//  LZBYKLive
//
//  Created by zibin on 16/9/22.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseDBModel.h"
#define default_Margin 3
#define default_EveryRow_Count   3


@interface LZBYKMainNearCellModel :BaseDBModel
@property (nonatomic, strong) NSString *liver_portrait;
@property (nonatomic, strong) NSString *liver_count;
@property (nonatomic, strong) NSString *liver_distance;
@property (nonatomic, strong) NSString *liver_stream;

//可以直接提出来作为ViewModel
@property (nonatomic, assign, readonly) CGRect coverImageViewFrame;
@property (nonatomic, assign, readonly) CGRect countButtonFrame;
@property (nonatomic, assign, readonly) CGRect distanceLabelFrame;
@property (nonatomic, assign) CGFloat cellHeight;
@end
@interface LZBYKMainNearCell : UICollectionViewCell

@property (nonatomic, strong) LZBYKMainNearCellModel *cellModel;
@end
