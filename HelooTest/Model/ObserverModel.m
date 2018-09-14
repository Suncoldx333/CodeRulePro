//
//  ObserverModel.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/23.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ObserverModel.h"

@interface ObserverModel ()

@property (nonatomic,readwrite,copy) NSString *resultStr;
@property (nonatomic,readwrite,assign) BOOL result;

@end

@implementation ObserverModel


- (void)fireNow {
    self.resultStr = @"asdad";
}

@end
