//
//  ReaSubModel1.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/29.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReaSubModel1 : NSObject

@property (nonatomic, copy) NSString *prop1;

@end

@interface ReaSubModel2 : NSObject

@property (nonatomic, copy) NSString *prop2;
+ (instancetype)share;

@end
