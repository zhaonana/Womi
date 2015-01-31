//
//  ResumeView.m
//  Womi
//
//  Created by NaNa on 15/1/31.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "ResumeView.h"

@implementation ResumeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - UIButtonClick
- (IBAction)buttonClick:(id)sender {
    if (self.resumeCellClickBlock) {
        self.resumeCellClickBlock();
    }
}

@end
