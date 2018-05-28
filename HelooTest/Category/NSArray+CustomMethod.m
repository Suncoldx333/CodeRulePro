//
//  NSArray+CustomMethod.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "NSArray+CustomMethod.h"

@implementation NSArray (CustomMethod)

-(id)objectiveReduce:(id)initialResult block:(nextPartialResultBlock)block {
    
    id result = initialResult;
    for (id x in self) {
        result = block(result, x);
    }
    return result;
    
}

-(NSMutableArray *)objectiveFilter:(isIncludeBlock)block {
    
    NSMutableArray *initialArray = [[NSMutableArray alloc] init];
    
    id filterResult =  [self objectiveReduce:initialArray block:^id(id result, id elemnt) {
        
        block(elemnt) ? [result addObject:elemnt] : result;
        return result;
    }];
    
    return (NSMutableArray *)filterResult;
    
}

-(NSMutableArray *)objectiveMap:(tranmsformBlock)block {
    
    NSMutableArray *initialArray = [[NSMutableArray alloc] init];
    id mapResult = [self objectiveReduce:initialArray block:^id(id result, id elemnt) {
        [result addObject:block(elemnt)];
        return result;
    }];
    return (NSMutableArray *)mapResult;
    
}

@end
