//
//  WeekSelectViewController.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WeekOrderType) {
    WeekOrderTypeMonday = 1 << 1,
    WeekOrderTypeTuesday = 1 << 2,
    WeekOrderTypeWednesday = 1 << 3,
    WeekOrderTypeThursday = 1 << 4,
    WeekOrderTypeFriday = 1 << 5,
    WeekOrderTypeSaturday = 1 << 6,
    WeekOrderTypeSunday = 1 << 0,
};

@interface WeekSelectViewController : UIViewController

@property (nonatomic, copy) void(^weekSelectBlock)(NSString *value);
+ (WeekSelectViewController *)viewControllerWithchosenDays:(NSString *)chosenDays;

@end

@interface testModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) WeekOrderType type;
@property (nonatomic, assign) BOOL chosen;

@end
