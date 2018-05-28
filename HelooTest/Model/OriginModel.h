//
//  OriginModel.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/21.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OriginModel : NSObject

@property (nonatomic,copy,readonly) NSString *hello;
@property (nonatomic,assign) BOOL helloBool;

- (instancetype)initWithHello:(NSString *)hello;
- (void)changeHello:(NSString *)hello;

@end
