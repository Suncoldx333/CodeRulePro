//
//  ChartView.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartViewProtocols.h"


@interface ChartView : UIView

/**
 5个点的全部信息，默认25℃，23：00~3：00，低风
 */
@property NSArray<id<ChartViewContentProtocol>> *infos;

/**
 更改X轴坐标

 @param beginTime X轴起始值
 @param endTime X轴终点值
 */
- (void)changeXAxisNumberRangeBeginWith:(id<ChartViewTimeProtocol>)beginTime endWith:(id<ChartViewTimeProtocol>)endTime;

@end

#pragma mark -
@interface ChartViewContentModel : NSObject<ChartViewContentProtocol>

@end

@interface ChartViewTimeModel : NSObject<ChartViewTimeProtocol>

@end
