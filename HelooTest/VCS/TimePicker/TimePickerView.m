//
//  TimePickerView.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/20.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TimePickerView.h"

static NSInteger const kPickerViewTag = 386;

@interface TimePickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>{
    
    NSMutableArray<NSString *> *hours;
    NSMutableArray<NSString *> *minutes;
}

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSMutableArray<UIPickerView *> *pickerViews;

@end

@implementation TimePickerView

- (instancetype)initWithFrame:(CGRect)frame componentCount:(NSInteger)count {
    
    if (self = [super initWithFrame:frame]) {
        
        hours = [[NSMutableArray alloc] init];
        minutes = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 24; i++) {
            NSString *hour = [NSString stringWithFormat:@"%2d", i];
            [hours addObject:hour];
        }
        for (int i = 0; i < 60; i++) {
            NSString *minute = [NSString stringWithFormat:@"%2d", i];
            [minutes addObject:minute];
        }
        self.count = count;
        self.pickerViews = [[NSMutableArray alloc] init];
        [self addSelectedZone];
        self.backgroundColor = [UIColor colorWithRGB:0xffffff];
        
        TimePickerTimeModel *model = [[TimePickerTimeModel alloc] init];
        model.hour = @8;
        model.minute = @0;
        self.times = @[model];
        [self addPickerViewsWithComponentCount:count];
        
        [self.pickerViews.firstObject selectRow:3 inComponent:0 animated:NO];
//        [self.pickerViews.firstObject selectRow:3 inComponent:1 animated:NO];
    }
    return self;
}

- (void)setTimes:(NSArray<id<ChartViewTimeProtocol>> *)times {
    
    NSAssert(times.count == self.count, @"TIMES COUNT SHOULD EQUAL TO COUNT CREATED BY INITIALIZE");
    _times = times;
    
}

#pragma mark -
- (void)addPickerViewsWithComponentCount:(NSInteger)count {
    
    for (NSInteger i = 0; i < count; i++) {
        
        CGFloat x = 122;
        UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(x, 7, ScreenWidth - x * 2, CGRectGetHeight(self.frame) - 58)];
        picker.delegate = self;
        picker.tag = kPickerViewTag + i;
        picker.showsSelectionIndicator = YES;
        picker.backgroundColor = [UIColor colorWithRGB:0xe2e2e2];
        [self addSubview:picker];
        [self.pickerViews addObject:picker];
    }
}

- (void)addSelectedZone {
    
    CALayer *upsideLine = [[CALayer alloc] init];
    upsideLine.frame = CGRectMake(0, 98, CGRectGetWidth(self.frame), 0.5);
    upsideLine.backgroundColor = [UIColor colorWithRGB:0x111111].CGColor;
    [self.layer addSublayer:upsideLine];
    
    CALayer *bottomLine = [[CALayer alloc] init];
    bottomLine.frame = CGRectMake(0, 141, CGRectGetWidth(self.frame), 0.5);
    bottomLine.backgroundColor = [UIColor colorWithRGB:0x111111].CGColor;
    [self.layer addSublayer:bottomLine];
}

#pragma mark - IPickerViewDelegate && UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return hours.count;
    }
    return minutes.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 67;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return 40.5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        return [hours objectAtIndex:row];
    }
    return [minutes objectAtIndex:row];
}

@end

#pragma mark -
@implementation TimePickerTimeModel

@synthesize hour;
@synthesize minute;

@end
