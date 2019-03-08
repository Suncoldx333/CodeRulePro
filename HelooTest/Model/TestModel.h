//
//  TestModel.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/8.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "JSONModel.h"

@interface TestModel : JSONModel

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, assign) BOOL bindState;

@end
