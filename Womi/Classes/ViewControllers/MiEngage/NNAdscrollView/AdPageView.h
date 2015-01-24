//
//  AdPageView.h
//  Womi
//
//  Created by NaNa on 15/1/24.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PAGE_VIEW_SPACE_BETWEEN_DOTS 6
#define PAGE_VIEW_DOT_WIDTH 7
#define PAGE_VIEW_DOT_HEIGHT 7
#define PAGE_VIEW_SELECTED_DOT_IMAGE @"dian_blue"
#define PAGE_VIEW_DOT_IMAGE @"dian_gray"

@interface AdPageView : UIView

@property (nonatomic, assign) NSInteger currentPage;

- (id)initWithPageNum:(NSInteger)pageNum;

@end
