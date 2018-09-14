//
//  ModeChange.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/7/17.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModeChangeProtocol <NSObject>

@property (nonatomic, copy) NSString *fid1;
@property (nonatomic, copy) NSString *fid2;
@property (nonatomic, copy) NSString *fid3;
@property (nonatomic, copy) NSString *fid4;
@property (nonatomic, copy) NSString *fid5;
@property (nonatomic, copy, getter=isFid6) NSString *fid6;
@property (nonatomic, assign) int fid7;

@end

@interface ModeChange : NSObject

@property (nonatomic, copy) NSString *fid1;
@property (nonatomic, copy) NSString *fid2;
@property (nonatomic, copy) NSString *fid3;
@property (nonatomic, copy) NSString *fid4;
@property (nonatomic, copy) NSString *fid5;
@property (nonatomic, copy, getter=isFid6) NSString *fid6;
@property (nonatomic, assign) int fid7;

@end

