//
//  RadarViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2019/3/8.
//  Copyright © 2019年 ZhaoyunWang. All rights reserved.
//

#import "RadarViewController.h"
#import "UIColor+EasyWay.h"

@interface RadarViewController ()

@end

@implementation RadarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    self.title = @"Radar";
    
//    CAShapeLayer *layer = [self customizeShapeLayerWithColor:[UIColor colorWithRGB:0xcfab80]
//                                                   lineWidth:100
//                                                      radius:50
//                                                   fromAngle:0
//                                                     toAngle:M_PI_2 * 3
//                                                   clockwise:YES];
//    [layer setPosition:CGPointMake(ScreenWidth / 2, ScreenHeight / 2)];
//    [self.view.layer addSublayer:layer];
    
    [self gradlineViewOne];
}

- (void)gradlineViewOne {
    CAGradientLayer *gradlineLayer = [CAGradientLayer layer];
    gradlineLayer.colors = @[(__bridge id)[UIColor colorWithRGB:0xcfab80].CGColor, (__bridge id)[[UIColor colorWithRGB:0xcfab80] colorWithAlphaComponent:0.5].CGColor];
    gradlineLayer.locations = @[@0.1, @1.0];
    gradlineLayer.startPoint = CGPointMake(1.0, 0.0);
    gradlineLayer.endPoint = CGPointMake(1.0, 1.0);
    gradlineLayer.frame = CGRectMake(20, 20, 100, 100);
    [self.view.layer addSublayer:gradlineLayer];
    
    CAGradientLayer *gradlineLayer1 = [CAGradientLayer layer];
    gradlineLayer1.colors = @[(__bridge id)[[UIColor colorWithRGB:0xcfab80] colorWithAlphaComponent:0.75].CGColor, (__bridge id)[[UIColor colorWithRGB:0xcfab80] colorWithAlphaComponent:0.5].CGColor];
    gradlineLayer1.locations = @[@0.1, @1.0];
    gradlineLayer1.startPoint = CGPointMake(1.0, 0.0);
    gradlineLayer1.endPoint = CGPointMake(1.0, 1.0);
    gradlineLayer1.frame = CGRectMake(20, 120, 100, 100);
    [self.view.layer addSublayer:gradlineLayer1];
}

- (CAShapeLayer *)customizeShapeLayerWithColor:(UIColor *)color
                                     lineWidth:(CGFloat)lineWidth
                                        radius:(CGFloat)radius
                                     fromAngle:(CGFloat)angle1
                                       toAngle:(CGFloat)angle2
                                     clockwise:(BOOL)clockwise {
    
    CAShapeLayer *line = [CAShapeLayer layer];
    [line setFillColor:[UIColor clearColor].CGColor];
    [line setStrokeColor:color.CGColor];
    [line setLineWidth:lineWidth];
    [line setLineJoin:kCALineCapRound];
    
    CGMutablePathRef path = CGPathCreateMutable();
    int clockwiseInt = clockwise ? 0 : 1;
    CGPathAddArc(path, NULL, 0, 0, radius, angle1, angle2, clockwiseInt);
    
    [line setPath:path];
    CGPathRelease(path);
    return line;
}

@end
