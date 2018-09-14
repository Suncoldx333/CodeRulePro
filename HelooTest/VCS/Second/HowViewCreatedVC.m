//
//  HowViewCreatedVC.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/14.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "HowViewCreatedVC.h"
#import "UIColor+EasyWay.h"

@interface HowViewCreatedVC ()

@end

@implementation HowViewCreatedVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.center = CGPointMake(ScreenWidth/ 2, ScreenHeight / 2);
    [button setBackgroundColor:[UIColor colorWithRGB:0xb2b2b2]];
    [button addTarget:self action:@selector(createEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)createEvent {
    
    HowViewCreatedView *subView = [[HowViewCreatedView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
//    subView.backgroundColor = [UIColor colorWithRGB:0x111111];
    [self.view addSubview:subView];
    
    NSLog(@"%@", subView.layer);
}

@end

#pragma mark -
@implementation HowViewCreatedView

//+ (Class)layerClass {
//    
//    return [HowViewCreatedLayer class];
//}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview {
    
    [super didMoveToSuperview];
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    [super drawLayer:layer inContext:ctx];
}

@end

#pragma mark -
@implementation HowViewCreatedLayer

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor colorWithRGB:0xb2b2b2].CGColor;
    }
    return self;
}

@end

