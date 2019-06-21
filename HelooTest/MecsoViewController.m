//
//  MecsoViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2019/3/22.
//  Copyright © 2019年 ZhaoyunWang. All rights reserved.
//

#import "MecsoViewController.h"
#import "BlalssdlViewController.h"
#import <HMSegmentedControl-BroadLink/HMSegmentedControl.h>
#import "NSUserDefaults+LOCAL.h"

@interface MecsoViewController ()<BlalssdlViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HMSegmentedControl *segmentControl;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MecsoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xf7f7f7];
    self.title = @"2_VC";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view).inset(0);
        make.bottom.mas_equalTo(self.view.mas_bottomMargin);
    }];
    [UserDefaults setObject:@(1) forKey:kSayHello];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.editing = YES;
    
    NSNumber *ids = [UserDefaults objectForKey:kSayHello];
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    BlalssdlViewController *vc = [[BlalssdlViewController alloc] init];
//    vc.delegate = self;
//    [self presentViewController:vc animated:YES completion:nil];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celllllId" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld_%ld", (long)indexPath.section, (long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
}

#pragma mark - GETTER
- (HMSegmentedControl *)segmentControl {
    if (!_segmentControl) {
        _segmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectZero];
        _segmentControl.sectionTitles = @[@"四四四四四四", @"四", @"四四四", @"四四四四四四", @"四四四", @"四四四"];
        _segmentControl.backgroundColor = [UIColor colorWithRGB:0xffffff];
        _segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x007fff], NSFontAttributeName : [UIFont boldSystemFontOfSize:14]};
        _segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRGB:0x999999], NSFontAttributeName : [UIFont systemFontOfSize:14]};
        _segmentControl.selectionIndicatorColor = [UIColor colorWithRGB:0x007fff];
        _segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentControl.selectionIndicatorHeight = 4;
        _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
        _segmentControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleDynamic;
        _segmentControl.segmentIndicatorWidth = 40;
        _segmentControl.segmentEdgeInset = UIEdgeInsetsMake(0, 8.5, 0, 8.5);
    }
    return _segmentControl;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"celllllId"];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}

@end
