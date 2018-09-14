//
//  ModelNewChange.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/7/17.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ModelNewChange.h"

@interface ModelNewChange ()

//@property (nonatomic, copy, readwrite) NSString *fid2;

@end

@implementation ModelNewChange

//@synthesize fid2 = _fid2;

- (void)changeModel:(NSString *)modelId {
    
    self->_fid2 = modelId;
}

@end
