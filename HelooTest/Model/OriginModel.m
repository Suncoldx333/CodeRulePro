//
//  OriginModel.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/21.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "OriginModel.h"

@interface OriginModel ()

@property (nonatomic,copy,readwrite) NSString *hello;

@end

@implementation OriginModel

-(instancetype)initWithHello:(NSString *)hello {
    if (self = [super init]) {
        self.hello = hello;
        self.helloBool = YES;
    }
    return self;
}

-(void)changeHello:(NSString *)hello {
    self.helloBool = NO;
}

@end
