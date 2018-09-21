//
//  ChartViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ChartViewController.h"
#import "UIColor+EasyWay.h"
#import "ChartDetailView.h"
#import "ChartView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ChartViewController ()

@property (nonatomic, strong) ChartView *detail;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    
    self.detail = [[ChartView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 400)];
    [self.view addSubview:self.detail];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, ScreenWidth, 50)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(showDetailEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)showDetailEvent {
    
    ChartViewTimeModel *model1 = [[ChartViewTimeModel alloc] init];
    model1.hour = @22;
    model1.minute = @43;
    
    ChartViewTimeModel *model2 = [[ChartViewTimeModel alloc] init];
    model2.hour = @13;
    model2.minute = @21;
    [self.detail changeXAxisNumberRangeBeginWith:model1 endWith:model2];
    
    NSArray *map = [[self.detail.infos.rac_sequence map:^id(id<ChartViewContentProtocol> value) {
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:[NSString stringWithFormat:@"type = %@", @(value.type)]];
        [array addObject:[NSString stringWithFormat:@"temp = %@", value.temperature]];
        [array addObject:[NSString stringWithFormat:@"hour = %@", value.time.hour]];
        [array addObject:[NSString stringWithFormat:@"minute = %@", value.time.minute]];
        return array;
        
    }] array];
    NSLog(@"%@", map);
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
