//
//  Device.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface Device : JSONModel

@property (nonatomic,copy) NSString *deviceId;
@property (nonatomic,copy) NSString *deviceOrder;
@property (nonatomic,copy) NSString *familyId;
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *userLoginSession;

@end
