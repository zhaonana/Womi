//
//  ResumePullCell.m
//  Womi
//
//  Created by NaNa on 15/1/31.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "ResumePullCell.h"

@implementation ResumePullCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UIButtonClick
- (IBAction)buttonClick:(UIButton *)sender {
    if (self.resumePullBlock) {
        self.resumePullBlock(sender.tag);
    }
}

@end
