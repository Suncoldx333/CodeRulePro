//
//  ChartViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ChartViewController.h"
#import "UIColor+EasyWay.h"
#import "ChartDetailView.h"
#import "ChartView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

static NSString *const kTableViewCellId1 = @"tableViewCellId";
static NSString *const kTableViewCellId2 = @"tableViewCellId";
static NSString *const kTableViewCellId3 = @"tableViewCellId";
static NSString *const kTableViewCellId4 = @"tableViewCellId";

@interface ChartViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSInteger count;
}

@property (nonatomic, strong) ChartView *detail;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray<ChartView *> *chartViews;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    
    self.chartViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 5; i ++) {
        
        CGFloat x = ScreenWidth * i;
        ChartView *chart = [[ChartView alloc] initWithFrame:CGRectMake(x, 0, ScreenWidth, 400)];
        [self.chartViews addObject:chart];
    }
    [self.view addSubview:self.tableView];
    
    
    
    /*
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, ScreenWidth, 50)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(showDetailEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
     */
}

#pragma mark -
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - navHeight)
                                                  style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellId1];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellId4];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellId3];

    }
    return _tableView;
}

- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 400)];
        _scrollView.contentSize = CGSizeMake(ScreenWidth * 5, 400);
        _scrollView.scrollEnabled = NO;
        for (ChartView *view in self.chartViews) {
            
            [_scrollView addSubview:view];
        }
    }
    return _scrollView;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 48;
    }else if (section == 1) {
        
        return 11;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 3) {
        
        return 58;
    }
    return 0.00001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 3) {
        
        return 400;
    }else if (indexPath.section == 2) {
        
        return 140;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 3) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellId4 forIndexPath:indexPath];
        [cell.contentView addSubview:self.scrollView];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellId1 forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRGB:0xffffff];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        
        [self tapEvent];
    }
}

#pragma mark -
- (void)tapEvent {
    
    if (!count) {
        count = 0;
    }
    count++;
    CGFloat x = (count % 5) * ScreenWidth;
    [self.scrollView scrollRectToVisible:CGRectMake(x, 0, ScreenWidth, 400)
                                animated:YES];
    
}



- (void)showDetailEvent {
    
    ChartViewTimeModel *model1 = [[ChartViewTimeModel alloc] init];
    model1.hour = @22;
    model1.minute = @43;
    
    ChartViewTimeModel *model2 = [[ChartViewTimeModel alloc] init];
    model2.hour = @13;
    model2.minute = @21;
    [self.detail changeXAxisNumberRangeBeginWith:model1 endWith:model2];
    
    NSArray *map = [[self.detail.infos.rac_sequence map:^id(id<ChartViewContentProtocol> value) {
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:[NSString stringWithFormat:@"type = %@", @(value.type)]];
        [array addObject:[NSString stringWithFormat:@"temp = %@", value.temperature]];
        [array addObject:[NSString stringWithFormat:@"hour = %@", value.time.hour]];
        [array addObject:[NSString stringWithFormat:@"minute = %@", value.time.minute]];
        return array;
        
    }] array];
    NSLog(@"%@", map);
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
