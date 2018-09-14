//
//  Family.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Module;

@interface Family : NSObject

@property (nonatomic,strong) NSMutableArray<Module *> *modules;
@property (nonatomic, copy, readonly) NSString *fid;
@property (nonatomic, strong) NSString *fid3;

@property (nonatomic, strong, readonly) NSArray *fids;


@property (nonatomic, copy) NSString *wiilChangA;

- (void)changFid:(NSString *)ssss;
+ (instancetype)shareInstance;

@end
