//
//  NNAdscrollView.h
//  Womi
//
//  Created by NaNa on 15/1/24.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNAdscrollView : UIView

@property (nonatomic, copy) void (^nnAdscorllViewClick)();

- (void)loadAdvertisesArray:(NSArray *)array;

@end
