//
//  TimeRepeatConfigureViewController.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeRepeatConfigureViewController : UIViewController

@property (nonatomic, copy) void(^repeatModeBlock)(NSString *value);
+ (TimeRepeatConfigureViewController *)viewControllerWithchosenDays:(NSString *)chosenDays;
+ (TimeRepeatConfigureViewController *)viewControllerInSpecifiedRepeatModeWithchosenDays:(NSString *)chosenDays;

@end
