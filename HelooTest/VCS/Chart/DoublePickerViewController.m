//
//  DoublePickerViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/28.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "DoublePickerViewController.h"
#import <Masonry/Masonry.h>
#import "DoublePickerViewController.h"
#import "CustomizePicker.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface DoublePickerViewController ()

@property (nonatomic, strong) UILabel *durationLabel;
@property (nonatomic, strong) CustomizePicker *beginPicker;
@property (nonatomic, strong) CustomizePicker *endPicker;

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) DoublePickerViewModel *model;

@end

@implementation DoublePickerViewController

+ (DoublePickerViewController *)viewControllerWith:(DoublePickerViewModel *)model {

    DoublePickerViewController *vc = [[DoublePickerViewController alloc] init];
    vc.model = model;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
    
    self.title = @"str_睡眠时段";
    [self addTitleView];
    [self addPicker];
    [self addButton];
    
    [self.beginPicker selectAt:self.model.beginHour minute:self.model.beginMinute];
    [self.endPicker selectAt:self.model.endHour minute:self.model.endMinute];
    [self bindData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (void)bindData {
    
    @weakify(self);
    [RACObserve(self.beginPicker, hour) subscribeNext:^(NSNumber *x) {
        
        @strongify(self);
        self.model.beginHour = x;
    }];
    [RACObserve(self.beginPicker, minute) subscribeNext:^(NSNumber *x) {
        
        @strongify(self);
        self.model.beginMinute = x;
    }];
    [RACObserve(self.endPicker, hour) subscribeNext:^(NSNumber *x) {
        
        @strongify(self);
        self.model.endHour = x;
    }];
    [RACObserve(self.endPicker, minute) subscribeNext:^(NSNumber *x) {
        
        @strongify(self);
        self.model.endMinute = x;
    }];
}

- (void)buttonEvent {
    
    NSInteger duration = [self timeDuration];
    if (duration < 240) {
        [self showAlertWithTimeEqual:duration == 0];
        return;
    }
    if (self.TimingDurationBlock) {
        self.TimingDurationBlock();
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
- (void)addTitleView {
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    titleView.backgroundColor = [UIColor colorWithRGB:0xffffff];
    [self.view addSubview:titleView];
    
    [titleView addSubview:self.durationLabel];
    
    UILabel *promtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 114, ScreenWidth, 20)];
    promtLabel.text = @"str_设置你的睡眠时段";
    promtLabel.textColor = [UIColor colorWithRGB:0x999999];
    promtLabel.textAlignment = NSTextAlignmentCenter;
    promtLabel.font = [UIFont systemFontOfSize:14];
    [titleView addSubview:promtLabel];
}

- (void)addPicker {
    
    UIView *containView = [[UIView alloc] initWithFrame:CGRectMake(0, 170, ScreenWidth, 226)];
    containView.backgroundColor = [UIColor colorWithRGB:0xffffff];
    [self.view addSubview:containView];
    
    self.beginPicker = [[CustomizePicker alloc] init];
    [containView addSubview:self.beginPicker];
    [self.beginPicker mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(CGRectGetHeight(containView.frame));
        make.centerY.equalTo(containView);
        make.left.equalTo(containView).offset(30);
    }];
    
    self.endPicker = [[CustomizePicker alloc] init];
    [containView addSubview:self.endPicker];
    [self.endPicker mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(CGRectGetHeight(containView.frame));
        make.centerY.equalTo(containView);
        make.right.equalTo(containView).offset(-30);
    }];
}

- (void)addButton {
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:[UIColor colorWithRGB:0xffaa00]];
    [button setTitle:@"str_确认" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGB:0xffffff] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 50));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}



- (NSInteger)timeDuration {
    
    NSInteger minutes = 0;
    if (self.model.beginHour < self.model.endHour || (self.model.beginHour == self.model.endHour && self.model.beginMinute <= self.model.endMinute)) {
        
        minutes += 60 - self.model.beginMinute.integerValue;
        minutes += self.model.endMinute.integerValue;
        minutes += (self.model.endHour.integerValue - self.model.beginHour.integerValue - 1) * 60;
    }else {
        
        minutes += 60 - self.model.beginMinute.integerValue;
        minutes += (24 - self.model.beginHour.integerValue - 1 + self.model.endHour.integerValue) * 60;
        minutes += self.model.endMinute.integerValue;
    }
    
    return minutes;
}

- (void)showAlertWithTimeEqual:(BOOL)equal {
    
    NSString *title = equal ? @"str_睡觉和起床时间不能相同" : @"str_睡眠时间需大于4小时";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:title
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"str_确定", nil)
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              
                                                          }];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark -
- (UILabel *)durationLabel {
    
    if (!_durationLabel) {
        _durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 54, ScreenWidth, 42)];
        _durationLabel.textAlignment = NSTextAlignmentCenter;
        [_durationLabel setAttributedText:[self durationAttributedString]];
    }
    return _durationLabel;
}

- (NSAttributedString *)durationAttributedString {
    
    NSString *title = [self.model toTimingString];
    NSDictionary *attrs = @{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x222222],
                            NSFontAttributeName : [UIFont systemFontOfSize:30]
                            };
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:title
                                                               attributes:attrs];
    return attr;
}

@end

#pragma mark -
@implementation DoublePickerViewModel

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.beginHour = @23;
        self.beginMinute = @0;
        self.endHour = @7;
        self.endMinute = @0;
    }
    return self;
}

- (NSString *)toTimingString {
    
    NSString *timing = [NSString stringWithFormat:@"%02d:%02d - %02d:%02d",
                        self.beginHour.intValue,
                        self.beginMinute.intValue,
                        self.endHour.intValue,
                        self.endMinute.intValue];
    return timing;
}

@end
