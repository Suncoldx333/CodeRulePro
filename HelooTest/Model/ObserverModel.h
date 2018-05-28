//
//  ObserverModel.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/23.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObserverModel : NSObject

@property (nonatomic,readonly,assign) BOOL result;
@property (nonatomic,readonly,copy) NSString *resultStr;

- (void)fireNow;

@end
