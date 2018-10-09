//
//  TimePickerSubviews.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TimePickerSubviews.h"
#import <Masonry/Masonry.h>

static NSInteger const kHourPickerTag = 286;
static NSInteger const kMinutePickerTag = 386;

@implementation TimePickerSubviews

@end

@interface TimeModelConfiureCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *signIcon;
@property (nonatomic, assign) TimeModelConfiureCellType type;

@end

#pragma mark -
@implementation TimeModelConfiureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(TimeModelConfiureCellType)type {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.type = type;
        [self.contentView addSubview:self.titleLabel];
        if (self.type == TimeModelConfiureCellTypeEntrance) {
            
            self.signIcon.image = [UIImage imageNamed:@"icon_arrow"];
        }else if (self.type == TimeModelConfiureCellTypeMultiSelect) {
            
            self.signIcon.image = [UIImage imageNamed:@"icon_beselected"];
        }
        [self.contentView addSubview:self.signIcon];
        [self.contentView addSubview:self.contentLabel];

        CALayer *line = [[CALayer alloc] init];
        line.frame = CGRectMake(15, 49.5, ScreenWidth - 15, 0.5);
        line.backgroundColor = [UIColor colorWithRGB:0xe1e1e1].CGColor;
        [self.contentView.layer addSublayer:line];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(70, 22));
            make.left.equalTo(self.contentView).offset(15);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.signIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            
            CGSize size = CGSizeZero;
            if (self.type == TimeModelConfiureCellTypeEntrance) {
                
                size = CGSizeMake(8, 14);
            }else if (self.type == TimeModelConfiureCellTypeSelect) {
                
                size = CGSizeMake(16, 16);
            }else if (self.type == TimeModelConfiureCellTypeMultiSelect) {
                
                size = CGSizeMake(23, 23);
            }

            make.size.mas_equalTo(size);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            CGFloat space = 10;
            CGFloat rightSpace = self.type == TimeModelConfiureCellTypeEntrance ? -6 : -8;
            make.top.equalTo(self.contentView).offset(14);
            make.left.mas_equalTo(self.titleLabel.mas_right).offset(space);
            make.bottom.equalTo(self.contentView).offset(-14);
            make.right.mas_equalTo(self.signIcon.mas_left).offset(rightSpace);
        }];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLabel.text = _title;
}

- (void)setContent:(NSString *)content {
    
    _content = content;
    self.contentLabel.text = _content;
}

- (void)setChosen:(BOOL)chosen {
    
    _chosen = chosen;
    if (self.type == TimeModelConfiureCellTypeSelect) {
        
        self.signIcon.image = _chosen ? [UIImage imageNamed:@"icon_select_lit"] : nil;
    }else if (self.type == TimeModelConfiureCellTypeMultiSelect) {
        
        self.signIcon.image = _chosen ? [UIImage imageNamed:@"Group"] : [UIImage imageNamed:@"icon_beselected"];
    }
    
}



#pragma mark -
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 22)];
        _titleLabel.textColor = [UIColor colorWithRGB:0x555555];
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 65, 22)];
        _contentLabel.textColor = [UIColor colorWithRGB:0x999999];
        _contentLabel.font = [UIFont systemFontOfSize:16];
        _contentLabel.textAlignment = NSTextAlignmentRight;
    }
    return _contentLabel;
}

- (UIImageView *)signIcon {
    
    if (!_signIcon) {
        _signIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _signIcon;
}

@end

#pragma mark - PICKERVIEW
@interface TimePickerView ()<UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate> {
    NSMutableArray<NSNumber *> *hours;
    NSMutableArray<NSNumber *> *minutes;
}

@property (nonatomic, strong) UIPickerView *hourPicker;
@property (nonatomic, strong) UIPickerView *minutePicker;

@property (nonatomic, strong, readwrite) NSNumber *hour;
@property (nonatomic, strong, readwrite) NSNumber *minute;

@property (nonatomic, strong) UIView *containView;

@end

@implementation TimePickerView

- (instancetype)init {
    
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, 226);
        self.userInteractionEnabled = YES;
        hours = [[NSMutableArray alloc] init];
        minutes = [[NSMutableArray alloc] init];
        self.hour = @8;
        self.minute = @0;
        
        for (NSInteger i = 0; i < 60; i++) {
            
            if (i < 24) {
                [hours addObject:@(i)];
            }
            [minutes addObject:@(i)];
        }
        
        [self addSubview:self.containView];
        
        [self.containView addSubview:self.hourPicker];
        [self.containView addSubview:self.minutePicker];
        
        [self.containView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(CGRectGetHeight(self.frame));
            make.centerX.equalTo(self);
        }];
        
        [self.hourPicker mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(CGRectGetHeight(self.frame));
            make.width.mas_equalTo(44);
            make.left.equalTo(self.containView);
        }];
        
        [self.minutePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(CGRectGetHeight(self.frame));
            make.width.mas_equalTo(44);
            make.left.mas_equalTo(self.hourPicker.mas_right).offset(40);
            make.right.mas_equalTo(self.containView.mas_right);
        }];
//
//        CALayer *upper = [[CALayer alloc] init];
//        upper.frame = CGRectMake(0, 88, ScreenWidth, 0.5);
//        upper.backgroundColor = [UIColor colorWithRGB:0xe1e1e1].CGColor;
//        [self.layer addSublayer:upper];
//
//        CALayer *lower = [[CALayer alloc] init];
//        lower.frame = CGRectMake(0, 141, ScreenWidth, 0.5);
//        lower.backgroundColor = [UIColor colorWithRGB:0xe1e1e1].CGColor;
//        [self.layer addSublayer:lower];
        
    }
    return self;
}

- (void)selectAt:(NSNumber *)hour minute:(NSNumber *)minute {
    
    [self.hourPicker selectRow:hour.integerValue inComponent:0 animated:NO];
    [self.minutePicker selectRow:minute.integerValue inComponent:0 animated:NO];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    CGRect touchRect = CGRectInset(self.bounds, 0, 0);
    if (CGRectContainsPoint(touchRect, point)) {

        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self.containView;
    }
    return nil;
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
    }
    self.minute = [minutes objectAtIndex:row];
}

#pragma mark -
- (UIView *)containView {
        
    if (!_containView) {
        _containView = [[UIView alloc] init];
        _containView.backgroundColor = [UIColor lightGrayColor];
    }
    return _containView;
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

@end
