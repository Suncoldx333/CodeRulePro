//
//  Family.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "Family.h"

@interface Family(){
//    NSMutableArray *_fids;
}

@property (nonatomic, strong, readwrite) NSMutableArray *fids;

@end

@implementation Family

@synthesize fids = _fids;

+ (instancetype)shareInstance {
    static Family *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[Family alloc] init];
    });
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
//        for (NSInteger i = 0; i < 999999999999; i++) {
//            @autoreleasepool {
//                NSString *d = [NSString stringWithFormat:@"%ld",(long)i];
//                [array addObject:d];
//            }
//        }
        _wiilChangA = @"now init";
    }
    return self;
}

- (void)changFid:(NSString *)ssss {
    
    self.wiilChangA = ssss;
    
}


@end
