//
//  ExperienceViewController.m
//  Womi
//
//  Created by zhongqinglongtu on 15-2-3.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "ExperienceViewController.h"

@interface ExperienceViewController ()
- (IBAction)buttonClick:(id)sender;

@end

@implementation ExperienceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)buttonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
