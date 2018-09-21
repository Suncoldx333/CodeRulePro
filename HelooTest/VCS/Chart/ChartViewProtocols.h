//
//  ChartViewProtocols.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#ifndef ChartViewProtocols_h
#define ChartViewProtocols_h

typedef NS_ENUM(NSInteger, BLHealthySleepWindSpeedType) {
    BLHealthySleepWindSpeedTypeAuto = 0,
    BLHealthySleepWindSpeedTypeSlow,
    BLHealthySleepWindSpeedTypeNormal,
    BLHealthySleepWindSpeedTypeFast,
};

@protocol ChartViewTimeProtocol <NSObject>

@property (nonatomic, strong) NSNumber *hour;
@property (nonatomic, strong) NSNumber *minute;

@end

@protocol ChartViewContentProtocol <NSObject>

@property (nonatomic, assign) BLHealthySleepWindSpeedType type;
@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) id<ChartViewTimeProtocol> time;

@end

#endif /* ChartViewProtocols_h */
