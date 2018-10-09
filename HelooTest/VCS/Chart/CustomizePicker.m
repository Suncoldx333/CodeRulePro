//
//  CustomizePicker.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/28.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "CustomizePicker.h"

static NSInteger const kHourPickerTag = 286;
static NSInteger const kMinutePickerTag = 386;

@interface CustomizePicker ()<UIPickerViewDelegate, UIPickerViewDataSource> {
    NSMutableArray<NSNumber *> *hours;
    NSMutableArray<NSNumber *> *minutes;
}

@property (nonatomic, strong) UIPickerView *hourPicker;
@property (nonatomic, strong) UIPickerView *minutePicker;

@property (nonatomic, strong, readwrite) NSNumber *hour;
@property (nonatomic, strong, readwrite) NSNumber *minute;

@end

@implementation CustomizePicker

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self initPickerData];
        [self addSubview:self.hourPicker];
        [self addSubview:self.minutePicker];
        
        [self.hourPicker mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(44, 226));
            make.left.equalTo(self);
            make.centerY.equalTo(self);
        }];
        
        [self.minutePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(44, 226));
            make.left.mas_equalTo(self.hourPicker.mas_right).offset(40);
            make.centerY.equalTo(self);
            make.right.equalTo(self);
        }];
    }
    return self;
}

- (void)selectAt:(NSNumber *)hour minute:(NSNumber *)minute {
    
    self.hour = hour;
    self.minute = minute;
    [self.hourPicker selectRow:[hours indexOfObject:hour] inComponent:0 animated:NO];
    [self.minutePicker selectRow:[minutes indexOfObject:minute] inComponent:0 animated:NO];
}

- (void)initPickerData {
    
    hours = [[NSMutableArray alloc] init];
    minutes = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 60; i++) {
        
        if (i < 24) {
            [hours addObject:@(i)];
        }
        [minutes addObject:@(i)];
    }
}

- (UIPickerView *)hourPicker {
    
    if (!_hourPicker) {
        _hourPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(110, 0, 44, 226)];
        _hourPicker.tag = kHourPickerTag;
        _hourPicker.delegate = self;
        _hourPicker.dataSource = self;
    }
    return _hourPicker;
}

- (UIPickerView *)minutePicker {
    
    if (!_minutePicker) {
        _minutePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(ScreenWidth - 145, 0, 44, 226)];
        _minutePicker.tag = kMinutePickerTag;
        _minutePicker.delegate = self;
        _minutePicker.dataSource = self;
    }
    return _minutePicker;
}

#pragma mark -
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (pickerView.tag == kHourPickerTag) {
        
        return hours.count;
    }
    return minutes.count;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    for (UIView *line in pickerView.subviews) {
        
        if (line.frame.size.height < 1) {
            
            line.hidden = YES;
        }
    }
    
    if (pickerView.tag == kHourPickerTag) {
        
        NSString *number = [NSString stringWithFormat:@"%02d", [hours objectAtIndex:row].intValue];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:number
                                                                   attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x555555],
                                                                                NSFontAttributeName : [UIFont systemFontOfSize:20]
                                                                                }];
        return attr;
    }
    NSString *number = [NSString stringWithFormat:@"%02d", [minutes objectAtIndex:row].intValue];
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:number
                                                               attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x555555],
                                                                            NSFontAttributeName : [UIFont systemFontOfSize:20]
                                                                            }];
    return attr;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 44;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return 50;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (pickerView.tag == kHourPickerTag) {
        
        self.hour = [hours objectAtIndex:row];
    }else {
        self.minute = [minutes objectAtIndex:row];
    }
}
@end
