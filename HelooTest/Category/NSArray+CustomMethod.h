//
//  NSArray+CustomMethod.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CustomMethod)

typedef id(^nextPartialResultBlock)(id result,id elemnt);

/**
 筛选条件
 
 @param elemnt 每个数组元素
 @return 筛选结果
 */
typedef BOOL(^isIncludeBlock)(id elemnt);

/**
 变换方法
 
 @param elemnt 每个数组元素
 @return 变换结果
 */
typedef id(^tranmsformBlock)(id elemnt);

-(id)objectiveReduce:(id)initialResult block:(nextPartialResultBlock)block;

/**
 数组筛选
 
 @param block 筛选条件
 @return 筛选结果
 */
-(NSMutableArray *)objectiveFilter:(isIncludeBlock)block;


/**
 数组变换
 
 @param block 变换方法
 @return 变换结果
 */
-(NSMutableArray *)objectiveMap:(tranmsformBlock)block;

@end
