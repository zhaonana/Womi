//
//  LabelManageViewController.m
//  Womi
//
//  Created by NaNa on 15/1/30.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "LabelManageViewController.h"

@interface LabelManageViewController ()

@end

@implementation LabelManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtonCLick
- (IBAction)buttonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
