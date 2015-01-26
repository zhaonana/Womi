//
//  CDRContentView.m
//  Womi
//
//  Created by NaNa on 15/1/25.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "CDRContentView.h"
#import "UIView+ITTAdditions.h"

@implementation CDRContentView

- (void)awakeFromNib {
    self.headImgView.layer.masksToBounds = YES;
    [self.headImgView.layer setCornerRadius:self.headImgView.width/2.0];
}

#pragma mark - UIButtonClick
- (IBAction)buttonClick:(UIButton *)sender {
    if (self.buttonClickBlock) {
        self.buttonClickBlock(sender.tag);
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
