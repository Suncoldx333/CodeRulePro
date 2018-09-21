//
//  LoadingAnimationVC.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/11.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "LoadingAnimationVC.h"
#import "LoadingAnimationLayer.h"
#import "UIColor+EasyWay.h"
#import "LoadingAnimationView.h"
#import <Masonry/Masonry.h>
#import "HomepageGradientView.h"

#import <UIKit/UIDynamicAnimator.h>

@interface LoadingAnimationVC ()<CAAnimationDelegate, UICollisionBehaviorDelegate>{
    NSInteger count;
    NSInteger lastCount;

    NSTimer *timer;
    CGPoint center;
}

@property (nonatomic, strong) LoadingAnimationLayer *loadingLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) LoadingAnimationView *loadingView;
@property (nonatomic, strong) CALayer *ballLayer;
@property (nonatomic, strong) HomepageGradientView *gradientView;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehav;
@property (nonatomic, strong) UICollisionBehavior *collisionBehav;
@property (nonatomic, strong) UIPushBehavior *pushBehav;

@end

@implementation LoadingAnimationVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    center = CGPointMake(ScreenWidth / 2, 200);
    self.view.backgroundColor = [UIColor whiteColor];
//
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
    [self.view addGestureRecognizer:tap];
    
//    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [self.view addSubview:subView];
//    
//    NSLog(@"%@", subView.layer.contents);
    
    /*
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [bt setTitle:@"Cancel" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(tapEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    bt.enabled = NO;
     */
     
//    [self makeDynamicAnimator];
//    [self makeGradient];
    [self makeBallAnimaiton];
    
    /*
    count = 0;
    self.loadingView = [[LoadingAnimationView alloc] init];
    self.loadingView.center = center;
    [self.view addSubview:self.loadingView];

    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(92);
    }];

    [self.loadingView startAnimation];
    */
}

- (void)tapEvent {

    NSLog(@"tap");
    
//    if (count % 2 == 0) {
//
//        [self.loadingView pauseAnimation];
//    }else {
//
//        [self.loadingView startAnimation];
//    }
//    count++;
//    [self.loadingView stopAniamiton];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (void)makeDynamicAnimator {
    
    UIImageView *ball = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    ball.backgroundColor = [UIColor colorWithRGB:0x111111];
    
    UIImageView *ball2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 300, 30)];
    ball2.backgroundColor = [UIColor colorWithRGB:0x111111];
    
    UIImageView *floor = [[UIImageView alloc] initWithFrame:CGRectMake(0, 600, ScreenWidth, ScreenHeight - 400)];
    floor.backgroundColor = [UIColor colorWithRGB:0xb2b2b2];
    
    [self.view addSubview:ball];
//    [self.view addSubview:ball2];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.collisionBehav = [[UICollisionBehavior alloc] init];
    self.collisionBehav.translatesReferenceBoundsIntoBoundary = YES;
    [self.collisionBehav addItem:ball];
    self.collisionBehav.collisionDelegate = self;
//    [self.collisionBehav addItem:ball2];
    
//    self.gravityBehav = [[UIGravityBehavior alloc] init];
//    self.gravityBehav.magnitude = 100;
//    [self.gravityBehav addItem:ball];
    
    self.pushBehav = [[UIPushBehavior alloc] initWithItems:@[ball] mode:UIPushBehaviorModeInstantaneous];
    self.pushBehav.magnitude = 1;
    CGVector vector = CGVectorMake(2, 2);
    self.pushBehav.pushDirection = vector;
    
    [self.animator addBehavior:self.collisionBehav];
    [self.animator addBehavior:self.pushBehav];
//    [self.animator addBehavior:self.gravityBehav];
}

- (void)makeGradient {
    
    [self ballGradient];
}

- (void)makeBallAnimaiton {
    
    self.ballLayer = [[CALayer alloc] init];
    self.ballLayer.frame = CGRectMake(0, 0, 50, 50);
    [self.ballLayer setPosition:CGPointMake(100 + 75 * 3 / 4, 25)];
    self.ballLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"pic_ball1"].CGImage);
    [self.view.layer addSublayer:self.ballLayer];
    
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.duration = 8.0;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                            ];
    ani.values = @[[NSValue valueWithCGPoint:CGPointMake(100 + 75 * 3 / 4, 25)],
                   [NSValue valueWithCGPoint:CGPointMake(25, 200)],
                   [NSValue valueWithCGPoint:CGPointMake(ScreenWidth - 25, 450)],
                   [NSValue valueWithCGPoint:CGPointMake(100 + 75 * 3 / 4, 25)]
                   ];
    ani.keyTimes = @[@0, @0.2, @0.6, @1];
    
    ani.repeatCount = HUGE_VALF;
    [self.ballLayer addAnimation:ani forKey:@"BALLANIMAITON"];
}

- (void)drawRadialGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor {
    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGFloat locations[] = {0.0, 1.0};
//
//    NSArray *colors = @[(__bridge id)startColor, (__bridge id)endColor];
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
}

#pragma mark -
- (void)singleGradient {
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(ScreenWidth / 2, ScreenHeight / 2, 100, 100);
    layer.startPoint = CGPointMake(0.5, 0);
    layer.endPoint = CGPointMake(0.5, 1);
    layer.colors = @[(__bridge id)[UIColor colorWithRGB:0x272727].CGColor, (__bridge id)[UIColor colorWithRGB:0x0c0c0c].CGColor];
    layer.type = kCAGradientLayerAxial;
    [self.view.layer addSublayer:layer];
}

- (void)ballGradient {
    
    HomepageGradientView *gradient = [[HomepageGradientView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    gradient.backgroundColor = [UIColor colorWithRGB:0xffffff];
    [self.view addSubview:gradient];
    [gradient mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)makeFun {
    
    if (count < 100) {
        count++;
        [self.loadingView setProgress:count / 100.00];
    }
}

@end
