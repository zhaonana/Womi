//
//  CDRContentView.h
//  Womi
//
//  Created by NaNa on 15/1/25.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDRContentView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel     *usernameLab;
@property (copy, nonatomic) void (^buttonClickBlock)(NSInteger tag);

@end
