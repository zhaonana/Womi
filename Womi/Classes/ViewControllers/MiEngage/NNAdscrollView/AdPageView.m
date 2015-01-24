//
//  AdPageView.m
//  Womi
//
//  Created by NaNa on 15/1/24.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "AdPageView.h"

@interface AdPageView ()

@property (nonatomic, assign) NSInteger   pageNum;
@property (nonatomic, strong) UIImageView *selectedImageView;

@end

@implementation AdPageView
- (CGFloat)getPageViewWidth:(NSInteger)pageNum {
    return pageNum * PAGE_VIEW_DOT_WIDTH + (pageNum - 1) * PAGE_VIEW_SPACE_BETWEEN_DOTS;
}

- (CGFloat)getDotXWithIndex:(NSInteger)index {
    return index * (PAGE_VIEW_SPACE_BETWEEN_DOTS + PAGE_VIEW_DOT_WIDTH);
}

- (id)initWithPageNum:(NSInteger)pageNum {
    self = [super initWithFrame:CGRectMake(0, 0, [self getPageViewWidth:pageNum], PAGE_VIEW_DOT_HEIGHT)];
    if (self) {
        _currentPage = 0;
        _pageNum = pageNum;
        
        for (int i = 0; i < _pageNum; i++) {
            @autoreleasepool {
                UIImageView *dotView = [[UIImageView alloc] initWithFrame:CGRectMake([self getDotXWithIndex:i], 0, PAGE_VIEW_DOT_WIDTH, PAGE_VIEW_DOT_HEIGHT)];
                dotView.image = [UIImage imageNamed:PAGE_VIEW_DOT_IMAGE];
                [self addSubview:dotView];
            }
        }
        
        _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, PAGE_VIEW_DOT_WIDTH, PAGE_VIEW_DOT_HEIGHT)];
        _selectedImageView.image = [UIImage imageNamed:PAGE_VIEW_SELECTED_DOT_IMAGE];
        [self addSubview:_selectedImageView];
        
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    CGRect frame = _selectedImageView.frame;
    frame.origin.x = [self getDotXWithIndex:_currentPage];
    _selectedImageView.frame = frame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
