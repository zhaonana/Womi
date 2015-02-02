//
//  PersonalDataViewController.m
//  Womi
//
//  Created by NaNa on 15/1/22.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "PersonalDataViewController.h"
#import "ResumeView.h"
#import "ResumePullCell.h"
#import "UIView+ITTAdditions.h"
#import "ResumeDetailViewController.h"

@interface PersonalDataViewController () <UITableViewDataSource, UITableViewDelegate> {
    int isopen[5];
}

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UITableView *resumeTableView;
@property (strong, nonatomic) NSMutableArray *resumeArray;

@end

@implementation PersonalDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
    
    _resumeArray = [[NSMutableArray alloc] initWithArray:@[@"产品经理",@"产品经理",@"产品经理",@"产品经理",@"产品经理"]];
    for (int i = 0; i < 5; i++) {
        isopen[i] = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SetUpView
- (void)setUpView {
    _headImgView.layer.masksToBounds = YES;
    [_headImgView.layer setCornerRadius:self.headImgView.width/2.0];
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!isopen[section]) {
        return 1;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ResumePullCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResumePullCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ResumePullCell" owner:self options:nil] lastObject];
    }
    cell.resumePullBlock = ^(NSInteger tag) {
        switch (tag) {
            case 10: {  //刷新
                
            }
                break;
            case 20: {  //设置默认
                
            }
                break;
            case 30: {  //公开
                
            }
                break;
            case 40: {  //查看
                ResumeDetailViewController *resumeVc = [[ResumeDetailViewController alloc] init];
                [self.navigationController pushViewController:resumeVc animated:YES];
            }
                break;
            case 50: {  //修改
                
            }
                break;
            case 60: {  //删除
                
            }
                break;
            default:
                break;
        }
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _resumeArray.count;
}

#pragma mark - UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 154.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 72.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ResumeView *cell = [[[NSBundle mainBundle] loadNibNamed:@"ResumeView" owner:self options:nil] lastObject];
    cell.resumeCellClickBlock = ^() {
        isopen[section] = !isopen[section];
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    };
    return cell;
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
