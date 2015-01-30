//
//  CONSTS.h
//  Womi
//
//  Created by NaNa on 15/1/24.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#define UISCREEN            [[UIScreen mainScreen] bounds]
#define SCREEN_HEIGHT       UISCREEN.size.height
#define SCREEN_WIDTH        UISCREEN.size.width

#define UICOLOR_RGB(r,g,b) UICOLOR_RGBA(r,g,b,1)
#define UICOLOR_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#pragma mark - 返回指定的ViewController
#define popToThisContrller(obj,num)  NSArray *viewControllerArray = obj.navigationController.viewControllers;\
UIViewController *controller = [viewControllerArray objectAtIndex:viewControllerArray.count - num];\
[obj.navigationController popToViewController:controller animated:YES];