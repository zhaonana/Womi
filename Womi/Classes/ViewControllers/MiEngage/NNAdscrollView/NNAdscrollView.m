//
//  NNAdscrollView.m
//  Womi
//
//  Created by NaNa on 15/1/24.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "NNAdscrollView.h"
#import "AdscrollView.h"
#import "UIView+ITTAdditions.h"
#import "AdPageView.h"

@interface NNAdscrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView       *adbackView;
@property (nonatomic, strong) NSArray      *advertisesArray;
@property (nonatomic, strong) UIScrollView *advertiseScrollView;
@property (nonatomic, strong) AdPageView   *myPageView;

@end

@implementation NNAdscrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    if (!_adbackView) {
        _adbackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        [self addSubview:_adbackView];
    }
    
    [self setUpAdvertiseView];
}

- (void)setUpAdvertiseView {
    if (!_advertiseScrollView) {
        _advertiseScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height )];
        _advertiseScrollView.delegate = self;
        _advertiseScrollView.pagingEnabled = YES;
        _advertiseScrollView.showsHorizontalScrollIndicator = NO;
        _advertiseScrollView.bounces = NO;
        [_adbackView addSubview:_advertiseScrollView];
    }
}

- (void)loadAdvertisesArray:(NSArray *)array {
    self.advertisesArray = array;
    [self addAdvertiseViews];
}

- (void)addAdvertiseViews {
    NSInteger count = [_advertisesArray count];
    if (count == 0) {
        return;
    }
    for(UIView *view in _advertiseScrollView.subviews){
        [view removeFromSuperview];
    }
    
    NSLog(@"count  %ld    %f",(unsigned long)_advertiseScrollView.subviews.count,_advertiseScrollView.contentOffset.x);
    
    _advertiseScrollView.contentOffset = CGPointMake(0, 0);
    
    for (int i = 0; i < count; i++) {
        AdscrollView *view = [[[NSBundle mainBundle] loadNibNamed:@"AdscrollView" owner:nil options:nil] lastObject];
        view.height = self.height;
        view.origin = CGPointMake(i * view.width, 0);
        view.adscrollViewClick = ^() {
            NSLog(@"adscrollViewClick");
        };
        [_advertiseScrollView addSubview:view];
    }
    _advertiseScrollView.contentSize = CGSizeMake(count * _advertiseScrollView.width, 0);
    if (count) {
        _myPageView = [[AdPageView alloc] initWithPageNum:count];
        _myPageView.center = CGPointMake(280, self.height - 20);
        [_advertiseScrollView.superview addSubview:_myPageView];
    }
    
    if ([_advertisesArray count] > 0) {
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(adverViewAnimation) object:nil];
        [self performSelector:@selector(adverViewAnimation) withObject:nil afterDelay:3.0];
    }
}

- (void)adverViewAnimation {
    int currentPage = floor((_advertiseScrollView.contentOffset.x - _advertiseScrollView.width/2) / _advertiseScrollView.width) + 1;
    currentPage = ((_advertiseScrollView.contentOffset.x - _advertiseScrollView.width/2) / _advertiseScrollView.width) + 1;
    NSInteger index = currentPage + 1;
    if (index == _advertisesArray.count) {
        [_advertiseScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        _myPageView.currentPage = 0;
        [self performSelector:@selector(adverViewAnimation) withObject:nil afterDelay:3.0];
    } else {
        [_advertiseScrollView setContentOffset:CGPointMake(self.width * index, 0) animated:YES];
        if (_advertisesArray.count>currentPage) {
            _myPageView.currentPage = index;
            [self performSelector:@selector(adverViewAnimation) withObject:nil afterDelay:3.0];
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int currentPage = ((_advertiseScrollView.contentOffset.x - _advertiseScrollView.width/2) / _advertiseScrollView.width) + 1;
    _myPageView.currentPage = currentPage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
