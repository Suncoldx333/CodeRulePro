//
//  WeekSelectViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "WeekSelectViewController.h"
#import "TimePickerSubviews.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

static NSString *const kCellId = @"cellId";

@interface WeekSelectViewController ()<UITableViewDelegate, UITableViewDataSource> {
    
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSMutableArray<testModel *> *weeks;;
@property (nonatomic, copy) NSString *chosenDays;;

@end

@implementation WeekSelectViewController

+ (WeekSelectViewController *)viewControllerWithchosenDays:(NSString *)chosenDays {
    
    WeekSelectViewController *vc = [[WeekSelectViewController alloc] init];
    vc.chosenDays = chosenDays;
    return vc;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weeks = [[NSMutableArray alloc] init];
    NSArray *weekNames = @[@"str_星期一", @"str_星期二", @"str_星期三", @"str_星期四", @"str_星期五", @"str_星期六", @"str_星期天"];
    NSArray<NSNumber *> *orders = @[@(WeekOrderTypeMonday), @(WeekOrderTypeTuesday), @(WeekOrderTypeWednesday), @(WeekOrderTypeThursday), @(WeekOrderTypeFriday), @(WeekOrderTypeSaturday), @(WeekOrderTypeSunday)];
    
    NSInteger number = self.chosenDays.integerValue;
    NSMutableArray<NSNumber *> *array = [[NSMutableArray alloc] init];
    while (number) {
        
        [array addObject:@(number % 10)];
        if (number / 10 < 1) {
            
            break;
        }
        number = number / 10 ;
    }
    
    for (NSInteger i = 0; i < weekNames.count - 1; i++) {
        
        testModel *model = [[testModel alloc] init];
        model.name = [weekNames objectAtIndex:i];
        
        if (array.count >= 1 && i < array.count - 1) {
            model.chosen = [array objectAtIndex:i + 1].integerValue > 0;
        }else {
            model.chosen = NO;
        }
        
        model.type = [orders objectAtIndex:i].integerValue;
        [self.weeks addObject:model];
    }
    testModel *model = [[testModel alloc] init];
    model.name = weekNames.lastObject;
    model.chosen = array.firstObject.integerValue > 0;
    model.type = orders.lastObject.integerValue;
    [self.weeks addObject:model];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.button];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50));
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(ScreenWidth);
        make.top.equalTo(self.view);
        make.bottom.mas_equalTo(self.button.mas_top);
    }];
    
    
    [self modifyButtonStatus];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (void)buttonEvent {
    
    NSArray<testModel *> *filter = [[self.weeks.rac_sequence filter:^BOOL(testModel *value) {
        
        return value.chosen;
    }] array];
    
    __block NSInteger count = 0;
    [filter enumerateObjectsUsingBlock:^(testModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        count += obj.type;
    }];
    NSString *change = [self getBinaryByDecimal:count];
    if (self.weekSelectBlock) {
        self.weekSelectBlock(change);
    }
    
    BOOL exit = NO;
    for (UIViewController *vc in self.navigationController.viewControllers) {
        
        if ([vc isKindOfClass:NSClassFromString(@"TimePickerVC")]) {
            
            exit = YES;
            [self.navigationController popToViewController:vc animated:YES];
            return;
        }
    }
    if (!exit) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)modifyButtonStatus {
    
    NSArray<testModel *> *filter = [[self.weeks.rac_sequence filter:^BOOL(testModel *value) {

        return value.chosen;
    }] array];

    self.button.backgroundColor = filter.count > 0 ? [UIColor colorWithRGB:0xffaa00] : [UIColor colorWithRGB:0xbfbfbf];
    self.button.enabled = filter.count > 0;
}

#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.weeks.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TimeModelConfiureCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if (!cell) {
        cell = [[TimeModelConfiureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId type:TimeModelConfiureCellTypeMultiSelect];
    }
    cell.title = [self.weeks objectAtIndex:indexPath.row].name;
    cell.chosen = [self.weeks objectAtIndex:indexPath.row].chosen;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TimeModelConfiureCell *cell = (TimeModelConfiureCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.chosen = !cell.chosen;
    [self.weeks objectAtIndex:indexPath.row].chosen = cell.chosen;
    [self modifyButtonStatus];
}

#pragma mark -
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - navHeight - 50) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIButton *)button {
    
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), ScreenWidth, 50)];
        [_button setTitle:@"str_确定" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor colorWithRGB:0xffaa00]];
        [_button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _button;
}

#pragma mark -
- (NSString *)getBinaryByDecimal:(NSInteger)decimal {
    
    NSString *binary = @"";
    while (decimal) {
        
        binary = [[NSString stringWithFormat:@"%ld", decimal % 2] stringByAppendingString:binary];
        if (decimal / 2 < 1) {
            
            break;
        }
        decimal = decimal / 2 ;
    }
    return binary;
}

@end

#pragma mark -
@implementation testModel

@end
