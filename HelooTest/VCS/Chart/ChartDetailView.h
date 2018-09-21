//
//  ChartDetailView.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartViewProtocols.h"

@interface ChartDetailView : UIView

@property (nonatomic, strong) NSArray<NSString *> *winds;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) id<ChartViewContentProtocol> content;

@end
