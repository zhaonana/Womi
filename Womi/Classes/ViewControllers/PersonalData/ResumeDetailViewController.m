//
//  ResumeDetailViewController.m
//  Womi
//
//  Created by NaNa on 15/2/2.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "ResumeDetailViewController.h"
#import "SimpleCell.h"

@interface ResumeDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSArray *optionsArray;

@end

@implementation ResumeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray *baseInfo = @[@"年龄",@"生日",@"工作经验",@"学历",@"所在地",@"目前状态"];
    NSArray *expectJob = @[@"工作性质",@"职位",@"城市",@"月薪"];
    NSArray *workExperience = @[@"编辑"];
    NSArray *projectExperience = @[@"编辑"];
    NSArray *educationExperience = @[@"编辑"];
    _dataArray = [NSMutableArray arrayWithObjects:baseInfo, expectJob, workExperience, projectExperience, educationExperience, nil];
    
    _optionsArray = @[@"基本信息",@"期望工作",@"工作经历",@"项目经验",@"教育经历"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtonClick
- (IBAction)buttonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [[_dataArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SimpleCell" owner:self options:nil] lastObject];
    }
    cell.optionsLab.text = [[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _optionsArray.count;
}

#pragma mark - UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_optionsArray objectAtIndex:section];
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
