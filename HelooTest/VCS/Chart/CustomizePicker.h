//
//  CustomizePicker.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/28.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomizePicker : UIView

@property (nonatomic, strong, readonly) NSNumber *hour;
@property (nonatomic, strong, readonly) NSNumber *minute;

- (void)selectAt:(NSNumber *)hour minute:(NSNumber *)minute;

@end
