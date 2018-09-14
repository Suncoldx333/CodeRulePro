//
//  ModelNewChange.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/7/17.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelNewChange : NSObject

@property (nonatomic, assign) int fid1;
@property (nonatomic, copy) NSString *fid2;
@property (nonatomic, copy) NSString *fid3;
@property (nonatomic, copy) NSString *fid4;
@property (nonatomic, copy) NSString *fid5;
@property (nonatomic, copy) NSString *fid6;
@property (nonatomic, copy) NSString *fid7;

- (void)changeModel:(NSString *)modelId;

@end
