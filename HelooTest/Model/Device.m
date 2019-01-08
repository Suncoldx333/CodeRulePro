//
//  Device.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "Device.h"

@implementation Device

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"deviceId" : @"deviceid",
                                                                  @"deviceOrder" : @"deviceorder"
                                                                  }];
}

+ (BOOL)propertyIsIgnored:(NSString *)propertyName {
    return [@[@"familyId", @"userLoginSession"] containsObject:propertyName];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    if (self = [super initWithDictionary:dict error:err]) {
        self.userLoginSession = @"12313";
    }
    return self;
}

@end
