//
//  TimePickerView.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/20.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+EasyWay.h"
#import "ChartViewProtocols.h"

@interface TimePickerView : UIView

@property (nonatomic, strong) NSArray<id<ChartViewTimeProtocol>> *times;

- (instancetype)initWithFrame:(CGRect)frame componentCount:(NSInteger)count;

@end

#pragma mark -
@interface TimePickerTimeModel : NSObject<ChartViewTimeProtocol>

@end
