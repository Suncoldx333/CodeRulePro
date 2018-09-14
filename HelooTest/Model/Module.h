//
//  Module.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Module : NSObject

@property (nonatomic, copy, readonly) NSString *deviceId;

-(void)changeReadOnly;

@end
