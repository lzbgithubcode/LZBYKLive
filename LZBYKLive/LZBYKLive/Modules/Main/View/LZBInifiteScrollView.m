//
//  LZBInifiteScrollView.m
//  三个ImageView的轮播图
//  Created by zibin on 16/9/18.
//  Copyright © 2016年 刘子彬（更多项目源码分享平台“开发者源代码” 微信号：developerCode 作者简介：iOS开发者，喜爱交流分享）.
//

#import "LZBInifiteScrollView.h"
#import "UIImageView+WebCache.h"

//imageView的个数
#define LZBAllImageViewCount 3
//pageControl底部间距
#define pageControl_bottom_Margin    10
//scrollView的宽度
#define scrollView_Width self.scrollView.frame.size.width
//scrollView的高度
#define scrollView_Height self.scrollView.frame.size.height

@interface LZBInifiteScrollView()<UIScrollViewDelegate>
#pragma mark - propertyUI控件
/**
 *  UIScrollView
 */
@property (nonatomic, strong)  UIScrollView  *scrollView;

/**
 *  页码指示
 */
@property (nonatomic, strong) UIPageControl *pageControl;

/**
 *  自定义页码指示图片大小
 */
@property (nonatomic, assign) CGSize   customPageControlImageSize;

#pragma mark - 定时器

@property (nonatomic,strong) NSTimer *timer;
@end

@implementation LZBInifiteScrollView

#pragma mark -------------------初始化-----------------------
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    //设置scrollView的尺寸
    self.scrollView.frame = self.bounds;
    //设置pageControl的尺寸
    self.pageControlPosition = self.pageControlPosition;
    //布局imageView
    for (NSInteger i = 0; i < LZBAllImageViewCount; i ++)
    {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * selfWidth, 0, selfWidth, selfHeight);
    }
    [self updateContent];
    [self setupScrollViewContentSize];
    
    
}

/**
 *  设置contentSize大小
 */
- (void)setupScrollViewContentSize
{
    if(self.images.count > 1)
    {
       
        self.scrollView.contentSize = CGSizeMake(scrollView_Width *LZBAllImageViewCount, 0);
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);

    }
    else
    {
        self.scrollView.contentSize = CGSizeZero;
        self.scrollView.contentOffset =CGPointZero;
    }
}

/**
 *  更新图片内容
 */
- (void)updateContent
{
    // 更新imageView上面的图片内容
    for (NSInteger i = 0; i < LZBAllImageViewCount; i++) { // i是用来获取imageView的
        UIImageView *imageView = self.scrollView.subviews[i];
        
        // 根据当前页码求出imageIndex
        NSInteger imageIndex = 0;
        if (i == 0) { // 左边
            imageIndex = self.pageControl.currentPage - 1;
            if (imageIndex == -1) { // 显示最后面一张
                imageIndex = self.images.count - 1;
            }
            
        } else if (i == 1) { // 中间
            
            imageIndex = self.pageControl.currentPage;
       
        } else if (i == 2) { // 右边
            imageIndex = self.pageControl.currentPage + 1;
            if (imageIndex == self.images.count) { // 显示最前面一张
                imageIndex = 0;
            }
        }
        
        imageView.tag = imageIndex;
    
        // 图片数据
        [self loadImage:imageIndex withImageView:imageView];

    }
}

- (void)loadImage:(NSInteger)imageIndex withImageView:(UIImageView *)imageView
{
    id obj = self.images[imageIndex];
    if ([obj isKindOfClass:[UIImage class]]) { // UIImage对象
        imageView.image = obj;
    } else if ([obj isKindOfClass:[NSString class]]) { // 本地图片名
        imageView.image = [UIImage imageNamed:obj];
    } else if ([obj isKindOfClass:[NSURL class]]) { // 远程图片URL
        [imageView sd_setImageWithURL:obj placeholderImage:self.placeholder];
    }
}



#pragma mark -----------------------重写set方法--------------------
- (void)setImages:(NSArray *)images
{
    if(images.count == 0) return;
    _images = images;
    self.pageControl.numberOfPages = images.count;
      [self startTimer];
}



#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 找出显示在最中间的imageView
    UIImageView *middleImageView = nil;
    // x值和偏移量x的最小差值
    CGFloat minDelta = MAXFLOAT;
    for (NSInteger i = 0; i < LZBAllImageViewCount; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        
        // x值和偏移量x差值最小的imageView，就是显示在最中间的imageView
        CGFloat currentDelta = 0;
           currentDelta = ABS(imageView.frame.origin.x - self.scrollView.contentOffset.x);
        
            if (currentDelta < minDelta)
            {
                minDelta = currentDelta;
                middleImageView = imageView;
            }
            self.pageControl.currentPage = middleImageView.tag;

    }
    

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateContent];
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
}
#pragma mark -指示器方法
- (void)setPageControlPosition:(LZBFocusScrollViewPageControllPosition)pageControlPosition
{
    _pageControlPosition = pageControlPosition;
    self.pageControl.hidden = (pageControlPosition == LZBFocusScrollViewPageControllPosition_Hidden);
    
    if(self.pageControl.hidden)  return;
    
    //设置pageControl位置
    CGSize size;
    
    if(self.customPageControlImageSize.width)  //有自定义图片
    {
        size = CGSizeMake(self.customPageControlImageSize.width * (self.pageControl.numberOfPages * 2 -1), self.customPageControlImageSize.height);
    }
    else
    {
        size = [self.pageControl sizeForNumberOfPages:self.pageControl.numberOfPages];
    }
    
    self.pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    
    CGFloat centerY =  scrollView_Height - size.height * 0.5 -  pageControl_bottom_Margin;
    if(_pageControlPosition == LZBFocusScrollViewPageControllPosition_BottomCenter || _pageControlPosition == LZBFocusScrollViewPageControllPosition_None)
    {
        self.pageControl.center = CGPointMake(scrollView_Width * 0.5, centerY);
    }
}

- (void)setpageControlCurrentColor:(UIColor *)currentColor OtherColor:(UIColor *)otherColor
{
    if(!currentColor || !otherColor)  return;
    
    self.pageControl.currentPageIndicatorTintColor = currentColor;
    self.pageControl.pageIndicatorTintColor = otherColor;
}

- (void)setPageControlCurrentImage:(UIImage *)currentImage OtherImage:(UIImage *)otherImage
{
    if(!currentImage  || !otherImage)  return;
    self.customPageControlImageSize = currentImage.size;
    [self.pageControl setValue:currentImage forKey:@"_currentPageImage"];
    [self.pageControl setValue:otherImage forKey:@"_pageImage"];
}


#pragma mark - 手势点击imageView
- (void)imageClick:(UITapGestureRecognizer *)tap
{
   if([self.foucsDelegate respondsToSelector:@selector(lzbInifiteScrollView:didSelectScrollViewIndex:)])
   {
       [self.foucsDelegate lzbInifiteScrollView:self didSelectScrollViewIndex:self.pageControl.currentPage];
   }
}

#pragma mark - 定时器操作
- (void)setInterValTime:(NSTimeInterval)interValTime
{
   if(interValTime)
   {
       _interValTime = interValTime;
       [self stopTimer];
       [self startTimer];
   }
}
- (void)startTimer
{
    self.timer =[NSTimer scheduledTimerWithTimeInterval:self.interValTime >=1 ? self.interValTime : 2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer =nil;
}

- (void)nextImage
{
   
    __weak typeof(self)weakSelf = self;
    
    [UIView animateWithDuration:0.25 animations:^{
       weakSelf.scrollView.contentOffset = CGPointMake(2 *self.scrollView.frame.size.width, 0);
    } completion:^(BOOL finished) {
        [weakSelf updateContent];
        [weakSelf setupScrollViewContentSize];
    }];
    
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

#pragma mark - 懒加载
- (UIScrollView *)scrollView
{
  if(_scrollView == nil)
  {
      _scrollView = [[UIScrollView alloc]init];
      _scrollView.pagingEnabled = YES;
      _scrollView.bounces = NO;
      _scrollView.showsHorizontalScrollIndicator = NO;
      _scrollView.showsVerticalScrollIndicator = NO;
      _scrollView.delegate = self;
      [self addSubview:_scrollView];
      
      
      //增加子控件
      for(NSInteger i = 0; i < LZBAllImageViewCount; i++)
      {
          UIImageView *imageView = [[UIImageView alloc]init];
          imageView.userInteractionEnabled = YES;
          [_scrollView addSubview:imageView];
          [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)]];
      }
      
      //初始化设置基本信息
      //占位图片
      self.placeholder = [UIImage imageNamed:@"default_ticker"];
      
  }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if(_pageControl == nil)
    {
        _pageControl = [[UIPageControl alloc] init];;
        _pageControl.hidesForSinglePage = YES;
        _pageControl.userInteractionEnabled = NO;
        [self addSubview:_pageControl];
    }
    return _pageControl;
    
}





@end
