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
#import "AwesomeMenu.h"
#import "UIView+ITTAdditions.h"

@interface MiEngageViewController () <UITableViewDataSource, UITableViewDelegate, AwesomeMenuDelegate>

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
    [self setUpAdvertiseView];
    [self setUpAwesomeMenu];
}

- (void)setUpAdvertiseView {
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

- (void)setUpAwesomeMenu {
    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:nil
                                                           highlightedImage:nil
                                                               ContentImage:[UIImage imageNamed:@"dating"]
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:nil
                                                           highlightedImage:nil
                                                               ContentImage:[UIImage imageNamed:@"bagua"]
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:nil
                                                           highlightedImage:nil
                                                               ContentImage:[UIImage imageNamed:@"xingqv"]
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:nil
                                                           highlightedImage:nil
                                                               ContentImage:[UIImage imageNamed:@"qiuzhi"]
                                                    highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, nil];
    
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"jia"]
                                                       highlightedImage:[UIImage imageNamed:@"jia"]
                                                           ContentImage:nil
                                                highlightedContentImage:nil];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem optionMenus:menus];
    menu.delegate = self;
    menu.menuWholeAngle = -M_PI_2;
    menu.farRadius = 110.0f;
    menu.endRadius = 100.0f;
    menu.nearRadius = 90.0f;
    menu.animationDuration = 0.3f;
    menu.startPoint = CGPointMake(self.view.width - 28, self.view.height - 78);
    [self.view addSubview:menu];
}

#pragma mark - AwesomeMenuDelegate
- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx {
    NSLog(@"Select the index : %ld",(long)idx);
}

- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu {
    NSLog(@"Menu was closed!");
}

- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"Menu is open!");
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
