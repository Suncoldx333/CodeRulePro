//
//  ReaSubModel1.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/29.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ReaSubModel1.h"

@implementation ReaSubModel1

- (NSString *)prop1 {
    return [ReaSubModel2 share].prop2;
}

@end

@implementation ReaSubModel2

+ (instancetype)share {
    static ReaSubModel2 *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[ReaSubModel2 alloc] init];
    });
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        self.prop2 = @"2";
    }
    return self;
}

@end
