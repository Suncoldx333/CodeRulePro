//
//  Module.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "Module.h"

@implementation Module

//@synthesize deviceId = _innerId;

-(id)init{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)changeReadOnly {
    _deviceId = @"sad";
}

@end
