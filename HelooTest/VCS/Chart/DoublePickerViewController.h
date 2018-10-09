//
//  DoublePickerViewController.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/28.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DoublePickerViewModel;

@interface DoublePickerViewController : UIViewController

@property (nonatomic, copy) void(^TimingDurationBlock)(void);

+ (DoublePickerViewController *)viewControllerWith:(DoublePickerViewModel *)model;

@end

@interface DoublePickerViewModel : NSObject

@property (nonatomic, strong) NSNumber *beginHour;
@property (nonatomic, strong) NSNumber *endHour;
@property (nonatomic, strong) NSNumber *beginMinute;
@property (nonatomic, strong) NSNumber *endMinute;

- (NSString *)toTimingString;

@end
