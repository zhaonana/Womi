//
//  PersonalDataViewController.m
//  Womi
//
//  Created by NaNa on 15/1/22.
//  Copyright (c) 2015年 NaNa. All rights reserved.
//

#import "PersonalDataViewController.h"
#import "SimpleCell.h"
#import "ResumeView.h"
#import "ResumePullCell.h"

@interface PersonalDataViewController () <UITableViewDataSource, UITableViewDelegate> {
    int isopen[5];
}

@property (weak, nonatomic) IBOutlet UITableView *resumeTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSArray *optionsArray;
@property (strong, nonatomic) NSMutableArray *resumeArray;

@end

@implementation PersonalDataViewController

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
    _resumeArray = [[NSMutableArray alloc] initWithArray:@[@"产品经理",@"产品经理",@"产品经理",@"产品经理",@"产品经理"]];
    for (int i = 0; i < 5; i++) {
        isopen[i] = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [[_dataArray objectAtIndex:section] count];
    if (!isopen[section]) {
        return 1;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    SimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleCell"];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"SimpleCell" owner:self options:nil] lastObject];
//    }
//    cell.optionsLab.text = [[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
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
//    return _optionsArray.count;
    return _resumeArray.count;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [_optionsArray objectAtIndex:section];
//}

#pragma mark - UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 35.0;
    return 154.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 30.0;
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
