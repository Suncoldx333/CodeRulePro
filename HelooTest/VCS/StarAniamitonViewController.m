//
//  StarAniamitonViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/21.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "StarAniamitonViewController.h"
#import "TouchCustomizeView.h"
#import <Masonry/Masonry.h>

static CGFloat const radius = 50;
static NSInteger const number = 5;

@interface StarAniamitonViewController ()

@end

@implementation StarAniamitonViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.equalTo(self.view).offset(110);
        make.top.equalTo(self.view).offset(10);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.right.mas_equalTo(view1.mas_left).offset(-20);
        make.top.equalTo(self.view).offset(10);
    }];
    
//    [self addStar];
    
    /*
    TouchCustomizeView *view = [[TouchCustomizeView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view.backgroundColor = [UIColor colorWithRGB:0x111111];
    [self.view addSubview:view];
    
    TouchCustomizeSubView *subView = [[TouchCustomizeSubView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    subView.center = CGPointMake(100, 0);
    subView.backgroundColor = [UIColor colorWithRGB:0xb2b2b2];
    [view addSubview:subView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
    [subView addGestureRecognizer:tap];
    */
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (void)tapEvent {
    
    NSLog(@"tap");
}

- (void)addStar {
    
    NSMutableArray <NSArray<NSNumber *> *> *points = [[NSMutableArray alloc] init];
    
    CGFloat totalAngle = (number - 2) * M_PI;
    CGFloat angle = (M_PI * 2.00 / number) / 2;
    
    for (NSInteger i = 0; i < number; i++) {
        
        CGFloat yLength = sin(angle * (1 + i * 2)) * radius;
        CGFloat xLength = cos(angle * (1 + i * 2)) * radius;
        NSNumber *x = [NSNumber numberWithFloat:radius - xLength];
        NSNumber *y = [NSNumber numberWithFloat:yLength];
        NSArray *point = [NSArray arrayWithObjects:x, y, nil];
        [points addObject:point];
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    NSArray<NSNumber *> *indexs = @[@0, @2, @4, @1, @3];
    [indexs enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray<NSNumber *> *point = [points objectAtIndex:obj.integerValue];
        CGPoint pointValue = CGPointMake(point.firstObject.floatValue, point.lastObject.floatValue);

        if (idx == 0) {
            
            [path moveToPoint:pointValue];
        }else {
            
            [path addLineToPoint:pointValue];
        }
    }];
    [path closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.position = CGPointMake(0, radius);
    layer.fillColor = [UIColor colorWithRGB:0xffffff].CGColor;
    layer.strokeColor = [UIColor colorWithRGB:0x111111].CGColor;
    layer.lineWidth = 1;
    layer.path = path.CGPath;
    
    [self.view.layer addSublayer:layer];
}

@end
