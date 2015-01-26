//
//  CDRViewController.h
//  CDRTranslucentSideBar
//
//  Created by UetaMasamichi on 2014/06/02.
//  Copyright (c) 2014年 nscallop. All rights reserved.
//

#import "BaseViewController.h"
#import "CDRTranslucentSideBar.h"

@interface CDRViewController : BaseViewController

@property (nonatomic, strong) CDRTranslucentSideBar *sideBar;

- (void)sideBarButtonClick:(NSInteger)tag;

@end
