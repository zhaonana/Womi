//
//  CDRViewController.m
//  CDRTranslucentSideBar
//
//  Created by UetaMasamichi on 2014/06/02.
//  Copyright (c) 2014年 nscallop. All rights reserved.
//

#import "CDRViewController.h"
#import "CONSTS.h"
#import "CDRContentView.h"
#import "PersonalDataViewController.h"
#import "LabelManageViewController.h"
#import "ResumeStatusViewController.h"
#import "SubscribePositionViewController.h"
#import "SettingViewController.h"

@interface CDRViewController () <CDRTranslucentSideBarDelegate, UIGestureRecognizerDelegate>

@end

@implementation CDRViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Create SideBar and Set Properties
	self.sideBar = [[CDRTranslucentSideBar alloc] init];
	self.sideBar.sideBarWidth = 135;
	self.sideBar.delegate = self;
    
    // Add PanGesture to Show SideBar by PanGesture
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    // Create Content of SideBar
    CDRContentView *contentView = [[[NSBundle mainBundle] loadNibNamed:@"CDRContentView" owner:self options:nil] lastObject];
    
    // Set ContentView in SideBar
    [self.sideBar setContentViewInSideBar:contentView];
    
    // ContentView buttonClick
    __block CDRViewController *cdrVc = self;
    contentView.buttonClickBlock = ^(NSInteger tag) {
        [self.sideBar dismiss];
        [cdrVc sideBarButtonClick:tag];
    };
}

#pragma mark - sideBarButtonClick
- (void)sideBarButtonClick:(NSInteger)tag {
    switch (tag) {
        case 10: {  //简历管理
            PersonalDataViewController *personalVc = [[PersonalDataViewController alloc] init];
            [self performSegueWithIdentifier:@"ResumeManage" sender:personalVc];
        }
            break;
        case 20: {  //标签管理
            LabelManageViewController *labelVc = [[LabelManageViewController alloc] init];
            [self.navigationController pushViewController:labelVc animated:YES];
        }
            break;
        case 30: {  //收藏职位
            UIViewController *engageVc = [[self storyboard]instantiateViewControllerWithIdentifier:@"EngageInfoViewController"];
            [self.navigationController pushViewController:engageVc animated:YES];
        }
            break;
        case 40: {  //简历状态
            ResumeStatusViewController *resumeVc = [[ResumeStatusViewController alloc] init];
            [self performSegueWithIdentifier:@"ResumeStatus" sender:resumeVc];
        }
            break;
        case 50: {  //职位订阅
            SubscribePositionViewController *subscribeVc = [[SubscribePositionViewController alloc] init];
            [self performSegueWithIdentifier:@"SubscribePosition" sender:subscribeVc];
        }
            break;
        case 60: {  //设置
            SettingViewController *setVc = [[SettingViewController alloc] init];
            [self.navigationController pushViewController:setVc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - Gesture Handler
- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer {
	// if you have left and right sidebar, you can control the pan gesture by start point.
	if (recognizer.state == UIGestureRecognizerStateBegan) {
		CGPoint startPoint = [recognizer locationInView:self.view];

		// Left SideBar
		if (startPoint.x < self.view.bounds.size.width / 2.0) {
			self.sideBar.isCurrentPanGestureTarget = YES;
		}
	}

	[self.sideBar handlePanGestureToShow:recognizer inView:self.view];

	// if you have only one sidebar, do like following
	 self.sideBar.isCurrentPanGestureTarget = YES;
	[self.sideBar handlePanGestureToShow:recognizer inView:self.view];
}

#pragma mark - CDRTranslucentSideBarDelegate
- (void)sideBar:(CDRTranslucentSideBar *)sideBar didAppear:(BOOL)animated {
    NSLog(@"Left SideBar did appear");
}

- (void)sideBar:(CDRTranslucentSideBar *)sideBar willAppear:(BOOL)animated {
    NSLog(@"Left SideBar will appear");
}

- (void)sideBar:(CDRTranslucentSideBar *)sideBar didDisappear:(BOOL)animated {
    NSLog(@"Left SideBar did disappear");
}

- (void)sideBar:(CDRTranslucentSideBar *)sideBar willDisappear:(BOOL)animated {
    NSLog(@"Left SideBar will disappear");
}

@end
