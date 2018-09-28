//
//  TimePickerSubviews.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimingContentProtocol <NSObject>

@property (nonatomic, strong) NSNumber *hour;
@property (nonatomic, strong) NSNumber *minute;
@property (nonatomic, copy) NSString *chosenDays;
@property (nonatomic, copy) NSString *actionId;
@property (nonatomic, copy) NSString *actionName;

@end

typedef NS_ENUM(NSInteger, TimeModelConfiureCellType) {
    TimeModelConfiureCellTypeEntrance = 0,
    TimeModelConfiureCellTypeSelect,
    TimeModelConfiureCellTypeMultiSelect

};

typedef NS_ENUM(NSInteger, TimingVCType) {
    TimingVCTypeCreate = 1 << 0,
    TimingVCTypeCreateWithSpecialMode = 1 << 1,  //“仅一次”次数用完
    TimingVCTypeModify = 1 << 2,
    TimingVCTypeModifyWithSpecialMode = 1 << 3,
};

@interface TimePickerSubviews : NSObject

@end

@interface TimeModelConfiureCell : UITableViewCell

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) BOOL chosen;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(TimeModelConfiureCellType)type;

@end

@interface TimePickerView : UIView

@property (nonatomic, strong, readonly) NSNumber *hour;
@property (nonatomic, strong, readonly) NSNumber *minute;

- (void)selectAt:(NSNumber *)hour minute:(NSNumber *)minute;

@end


