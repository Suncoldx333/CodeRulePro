//
//  TimePickerViewModel.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "TimePickerSubviews.h"

@interface TimePickerViewModel : NSObject<TimingContentProtocol>

@property (nonatomic, strong, readonly) RACCommand *deleteCommand;
@property (nonatomic, strong, readonly) RACCommand *saveCommand;

- (instancetype)initWith:(id<TimingContentProtocol>)content;

@end
