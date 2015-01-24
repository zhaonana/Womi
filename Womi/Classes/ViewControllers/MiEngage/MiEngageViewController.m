//
//  MiEngageViewController.m
//  Womi
//
//  Created by NaNa on 15/1/22.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "MiEngageViewController.h"
#import "MiEngageCell.h"
#import "NNAdscrollView.h"
#import "CONSTS.h"
#import "FamousEnterpriseViewController.h"
#import "JobDetailViewController.h"

@interface MiEngageViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView      *adScrollBackView;
@property (strong, nonatomic) NSMutableArray     *dataArray;

@end

@implementation MiEngageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
    
    _dataArray = [[NSMutableArray alloc] initWithObjects:
                  @"1",
                  @"2",
                  @"3",
                  @"4",
                  @"5", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SetUpView
- (void)setUpView {
    NNAdscrollView *advertiseView = [[NNAdscrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 122)];
    advertiseView.backgroundColor = [UIColor whiteColor];
    [_adScrollBackView addSubview:advertiseView];
    
    //暂时写在这里 有数据再修改
    [advertiseView loadAdvertisesArray:@[@"1",@"2",@"3"]];
    __block MiEngageViewController *miVc = self;
    advertiseView.nnAdscorllViewClick = ^() {
        FamousEnterpriseViewController *famousVc = [[FamousEnterpriseViewController alloc] init];
        [miVc.navigationController pushViewController:famousVc animated:YES];
    };
}

#pragma mark - UIButtonClick
- (IBAction)buttonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MiEngageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MiEngageCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MiEngageCell" owner:self options:nil] lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark - UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 86.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JobDetailViewController *jobVc = [[JobDetailViewController alloc] init];
    [self.navigationController pushViewController:jobVc animated:YES];
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
