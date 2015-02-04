//
//  EducationViewController.m
//  Womi
//
//  Created by zhongqinglongtu on 15-2-3.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()
- (IBAction)buttonClick:(UIButton *)sender;

@end

@implementation EducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
