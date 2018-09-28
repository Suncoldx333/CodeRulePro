//
//  TimePickerVC.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/20.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimePickerSubviews.h"

@class TimePickerActionModel;

@interface TimePickerVC : UIViewController

/**
 定时创建/修改/删除回调，删除时，timing=nil;
 */
@property (nonatomic, copy) void(^timingModifyBlock)(id<TimingContentProtocol> timing, NSString *timingId);

/**
 定时页面创建

 @param type 类型
 @return 页面
 */
+ (TimePickerVC *)viewControllerCreateWithType:(TimingVCType)type;

/**
 定时页面修改

 @param type 类型
 @param timingId 定时id
 @param content 内容
 @return 页面
 */
+ (TimePickerVC *)viewControllerModifyWithType:(TimingVCType)type
                                      timingId:(NSString *)timingId
                                       content:(id<TimingContentProtocol>)content;


@end


@interface TimePickerActionModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *actionId;

@end
