//
//  TimeRepeatConfigureViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TimeRepeatConfigureViewController.h"
#import "TimePickerSubviews.h"
#import "WeekSelectViewController.h"

static NSString *const kCellId = @"cellId";

@interface TimeRepeatConfigureViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSArray *repeatTypes;
    NSMutableArray *repeatTypeMaps;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *chosenDays;
@property (nonatomic, assign) BOOL isSpecifiedRepeatMode;

@end

@implementation TimeRepeatConfigureViewController

+ (TimeRepeatConfigureViewController *)viewControllerWithchosenDays:(NSString *)chosenDays {
    
    TimeRepeatConfigureViewController *vc = [[TimeRepeatConfigureViewController alloc] init];
    vc.chosenDays = chosenDays;
    return vc;
}

+ (TimeRepeatConfigureViewController *)viewControllerInSpecifiedRepeatModeWithchosenDays:(NSString *)chosenDays {
    
    TimeRepeatConfigureViewController *vc = [[TimeRepeatConfigureViewController alloc] init];
    vc.chosenDays = chosenDays;
    vc.isSpecifiedRepeatMode = YES;
    return vc;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    repeatTypes = @[@"str_仅一次", @"str_每天", @"str_工作日", @"str_周末", @"str_自定义"];
    repeatTypeMaps = [@[@"0", @"1111111", @"111110", @"1000001"] mutableCopy];

    if (![repeatTypeMaps containsObject:self.chosenDays]) {
        [repeatTypeMaps addObject:self.chosenDays];
    }
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - navHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}

#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return repeatTypes.count;
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
        cell = [[TimeModelConfiureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId type:TimeModelConfiureCellTypeSelect];
    }
    cell.title = [repeatTypes objectAtIndex:indexPath.row];
    cell.chosen = [repeatTypeMaps indexOfObject:self.chosenDays] == indexPath.row;
    if (indexPath.row == repeatTypes.count - 1 && repeatTypeMaps.count == 5) {
        
        cell.content = [self getBinaryByDecimal:self.chosenDays];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[tableView visibleCells] enumerateObjectsUsingBlock:^(__kindof UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (!(self.isSpecifiedRepeatMode && indexPath.row == 0)) {
            
            ((TimeModelConfiureCell *)obj).chosen = (idx == indexPath.row);
        }
    }];
    
    if (indexPath.row == 4) {
        
        NSString *days = repeatTypeMaps.count < 5 ? @"0" : repeatTypeMaps.lastObject;
        WeekSelectViewController *vc = [WeekSelectViewController viewControllerWithchosenDays:days];
        __weak typeof(self) weakSelf = self;
        vc.weekSelectBlock = ^(NSString *value) {
            
            if (weakSelf.repeatModeBlock) {
                weakSelf.repeatModeBlock(value);
            }
        };
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        
        if (!(self.isSpecifiedRepeatMode && indexPath.row == 0)) {
            if (self.repeatModeBlock) {
                self.repeatModeBlock([repeatTypeMaps objectAtIndex:indexPath.row]);
            }
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
}

- (NSString *)getBinaryByDecimal:(NSString *)decimal {
    
    if (decimal.integerValue == 0) {
        return @"str_仅一次";
    }
    
    NSArray *weekNames = @[@"str_周日", @"str_周一", @"str_周二", @"str_周三", @"str_周四", @"str_周五", @"str_周六"];
    NSMutableArray *chosenWeekNames = [[NSMutableArray alloc] init];
    
    NSInteger number = decimal.integerValue;
    NSMutableArray<NSNumber *> *array = [[NSMutableArray alloc] init];
    while (number) {
        
        [array addObject:@(number % 10)];
        if (number / 10 < 1) {
            
            break;
        }
        number = number / 10 ;
    }
    
    [array enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.integerValue > 0) {
            
            [chosenWeekNames addObject:[weekNames objectAtIndex:idx]];
        }
    }];
    
    return [chosenWeekNames componentsJoinedByString:@"、"];
}

@end
