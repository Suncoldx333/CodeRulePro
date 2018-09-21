//
//  TimePickerVC.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/20.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TimePickerVC.h"
#import "TimePickerView.h"

@interface TimePickerVC ()

@property (nonatomic, strong) TimePickerView *picker;

@end

@implementation TimePickerVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
    
    [self.view addSubview:self.picker];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (TimePickerView *)picker {
    
    if (!_picker) {
        _picker = [[TimePickerView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 262)
                                            componentCount:1];
    }
    return _picker;
}

@end
