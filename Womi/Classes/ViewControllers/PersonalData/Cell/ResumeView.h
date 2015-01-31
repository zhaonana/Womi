//
//  ResumeView.h
//  Womi
//
//  Created by NaNa on 15/1/31.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResumeView : UIView

@property (weak, nonatomic) IBOutlet UILabel *positionLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (copy, nonatomic) void (^resumeCellClickBlock)();

@end
