//
//  TimePickerVC.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/20.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TimePickerVC.h"

#import <Masonry/Masonry.h>
#import "TimePickerSubviews.h"
#import "TimePickerViewModel.h"

#import "TimeRepeatConfigureViewController.h"

static NSString *const kTimePickerCellId = @"timePickerCellId";
static NSString *const kCellId = @"cellId";
static NSString *const kDeleteCellId = @"deleteCellId";

@interface TimePickerVC ()<UITableViewDelegate, UITableViewDataSource> {
    
    TimingVCType createType;
    TimingVCType specialModeType;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) TimePickerViewModel *viewModel;
@property (nonatomic, strong) UIAlertController *alert;
@property (nonatomic, strong) UIAlertController *deleteAlert;
@property (nonatomic, strong) TimePickerView *picker;
@property (nonatomic, assign) TimingVCType type;
@property (nonatomic, copy) NSString *timingId;

@end

@implementation TimePickerVC

+ (TimePickerVC *)viewControllerCreateWithType:(TimingVCType)type {
    
    TimePickerVC *vc = [[TimePickerVC alloc] init];
    vc.type = type;
    vc.viewModel = [[TimePickerViewModel alloc] init];
    return vc;
}

+ (TimePickerVC *)viewControllerModifyWithType:(TimingVCType)type
                                      timingId:(NSString *)timingId
                                       content:(id<TimingContentProtocol>)content {
    
    TimePickerVC *vc = [[TimePickerVC alloc] init];
    vc.type = type;
    vc.timingId = timingId;
    vc.viewModel = [[TimePickerViewModel alloc] initWith:content];
    return vc;
}

#pragma mark -

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
    
    createType = TimingVCTypeCreate | TimingVCTypeCreateWithSpecialMode;
    specialModeType = TimingVCTypeCreateWithSpecialMode | TimingVCTypeModifyWithSpecialMode;
    self.picker = [[TimePickerView alloc] init];

    [self bindViewModel];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.button];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 44));
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(ScreenWidth);
        make.top.equalTo(self.view);
        make.bottom.mas_equalTo(self.button.mas_top);
    }];
    
}

- (void)bindViewModel {

    if (self.type == TimingVCTypeCreateWithSpecialMode) {
        
        self.viewModel.chosenDays = @"1111111";
    }
    @weakify(self);
    [RACObserve(self.viewModel, actionId) subscribeNext:^(NSString *x) {
        
        @strongify(self);
        UIColor *bgColor = x.length > 0 ? [UIColor colorWithRGB:0xffaa00] : [UIColor colorWithRGB:0xbfbfbf];
        [self.button setBackgroundColor:bgColor];
    }];
    
    [RACObserve(self.picker, hour) subscribeNext:^(NSNumber *x) {
        
        @strongify(self);
        self.viewModel.hour = x;
    }];
    
    [RACObserve(self.picker, minute) subscribeNext:^(NSNumber *x) {
        
        @strongify(self);
        self.viewModel.minute = x;
    }];
    
    [self.viewModel.saveCommand.executing subscribeNext:^(id x) {
        
        if ([x boolValue]) {
            
            
        }
    }];
    
    [self.viewModel.saveCommand.errors subscribeNext:^(NSError *x) {
        
        
    }];
    
    [[self.viewModel.saveCommand.executionSignals switchToLatest] subscribeNext:^(NSString *x) {
        
        @strongify(self);
        if (self.timingModifyBlock) {
            self.timingModifyBlock(self.viewModel, x);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.viewModel.deleteCommand.executing subscribeNext:^(id x) {
        
        if ([x boolValue]) {
            
            
        }
    }];
    
    [self.viewModel.deleteCommand.errors subscribeNext:^(NSError *x) {
        
        
    }];
    
    [[self.viewModel.deleteCommand.executionSignals switchToLatest] subscribeNext:^(id x) {
        
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
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
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTimePickerCellId];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kDeleteCellId];
    }
    return _tableView;
}

- (UIButton *)button {
    
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        [_button setBackgroundColor:[UIColor colorWithRGB:0xffaa00]];
        [_button setTitle:@"str_保存" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor colorWithRGB:0xffffff] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:16];
        [_button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIAlertController *)alert {
    
    if (!_alert) {
        _alert = [UIAlertController alertControllerWithTitle:nil
                                                     message:NSLocalizedString(@"str_请选择要执行的操作",nil) preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"str_确定", nil)
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  
                                                              }];
        [_alert addAction:confirmAction];
    }
    return _alert;
}

- (UIAlertController *)deleteAlert {
    
    if (!_deleteAlert) {
        _deleteAlert = [UIAlertController alertControllerWithTitle:nil
                                                     message:NSLocalizedString(@"str_确定要删除该定时？",nil) preferredStyle:UIAlertControllerStyleAlert];
        
        __weak typeof(self) weakSelf = self;
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"str_删除", nil)
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  
                                                                  [weakSelf.viewModel.deleteCommand execute:weakSelf.timingId];
                                                              }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"str_取消", nil)
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 
                                                             }];
        [_deleteAlert addAction:cancelAction];
        [_deleteAlert addAction:confirmAction];
    }
    return _deleteAlert;
}

- (void)buttonEvent {
    
    if (self.viewModel.actionId.length > 0 || YES) {
        
        [self.viewModel.saveCommand execute:nil];
    }else {
        
        [self presentViewController:self.alert animated:YES completion:nil];
    }
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.type & createType) {
        
        return 2;
    }
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0 || section == 2) {
        
        return 1;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 10;
    }else if (section == 1) {
        
        return 40;
    }
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        return 226;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimePickerCellId forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor colorWithRGB:0xffffff];
        [self.picker selectAt:self.viewModel.hour minute:self.viewModel.minute];
        [cell.contentView addSubview:self.picker];
        return cell;
    }else if (indexPath.section == 2) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDeleteCellId forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor colorWithRGB:0xffffff];
        cell.textLabel.text = @"str_删除";
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor colorWithRGB:0xfa5032];
        return cell;
    }
    TimeModelConfiureCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if (!cell) {
        cell = [[TimeModelConfiureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId type:TimeModelConfiureCellTypeEntrance];
    }
    cell.title = indexPath.row == 0 ? @"str_重复设置" : @"str_操作";
    
    NSString *repeatMode = [self getBinaryByDecimal:self.viewModel.chosenDays];
    cell.content = indexPath.row == 0 ? repeatMode : @"str_未设置";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            
            TimeRepeatConfigureViewController *vc;
            if (self.type & specialModeType) {
                
                vc = [TimeRepeatConfigureViewController viewControllerInSpecifiedRepeatModeWithchosenDays:self.viewModel.chosenDays];
            }else {
                
                vc = [TimeRepeatConfigureViewController viewControllerWithchosenDays:self.viewModel.chosenDays];
            }

            vc.repeatModeBlock = ^(NSString *value) {
                
                self.viewModel.chosenDays = value;
                NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:1];
                [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
            };
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            
            
        }
    }else if (indexPath.section == 2) {
        
        [self presentViewController:self.deleteAlert animated:YES completion:nil];
    }
}

#pragma mark -
- (NSString *)getBinaryByDecimal:(NSString *)decimal {
    
    switch (decimal.integerValue) {
        case 0:
            return @"str_仅一次";
            break;
        case 1111111:
            return @"str_每天";
            break;
        case 111110:
            return @"str_工作日";
            break;
        case 1000001:
            return @"str_周末";
            break;
        default:
            break;
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

#pragma mark -
@implementation TimePickerActionModel

@end


