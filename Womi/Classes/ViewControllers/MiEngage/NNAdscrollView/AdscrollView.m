//
//  AdscrollView.m
//  Womi
//
//  Created by NaNa on 15/1/24.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "AdscrollView.h"

@implementation AdscrollView

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adscrollViewTap:)];
    [self addGestureRecognizer:tap];
}

- (void)adscrollViewTap:(UITapGestureRecognizer *)tap {
    if (self.adscrollViewClick) {
        self.adscrollViewClick();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
