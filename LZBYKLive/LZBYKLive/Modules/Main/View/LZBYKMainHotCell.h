//
//  LZBYKMainHotCell.h
//  LZBYKLive
//
//  Created by zibin on 16/9/22.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseDBModel.h"


@interface LZBYKMainHotCellModel :BaseDBModel
@property (nonatomic, strong) NSString *liver_portrait;
@property (nonatomic, strong) NSString *liver_name;
@property (nonatomic, strong) NSString *liver_city;
@property (nonatomic, strong) NSString *audience_count;
@property (nonatomic, strong) NSString *liver_imageUrl;
@property (nonatomic, strong) NSString *liver_stream;

//可以直接提出来作为ViewModel
@property (nonatomic, assign, readonly) CGRect iconImageViewFrame;
@property (nonatomic, assign, readonly) CGRect nameLabelFrame;
@property (nonatomic, assign, readonly) CGRect locationButtonFrame;
@property (nonatomic, assign, readonly) CGRect peopleLabelFrame;
@property (nonatomic, assign, readonly) CGRect tipLabelFrame;
@property (nonatomic, assign, readonly) CGRect contentImageViewFrame;
@property (nonatomic, assign) CGFloat cellHeight;
@end


@interface LZBYKMainHotCell : UITableViewCell

@property (nonatomic, strong) LZBYKMainHotCellModel *cellModel;

@end
