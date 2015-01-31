//
//  ResumePullCell.h
//  Womi
//
//  Created by NaNa on 15/1/31.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResumePullCell : UITableViewCell

@property (nonatomic, copy) void (^resumePullBlock)(NSInteger tag);

@end
