//
//  LZBRecordProcessView.h
//  LZBRecordingVideo
//
//  Created by Apple on 2017/2/26.
//  Copyright © 2017年 子彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#define lineWith    5

@interface LZBRecordProcessView : UIView

//初始化
- (instancetype)initWithCenter:(CGPoint )center radius:(CGFloat)radius;

@property  (nonatomic, assign) CGFloat progress;
@end
