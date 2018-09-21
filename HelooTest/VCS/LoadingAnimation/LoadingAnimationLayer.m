//
//  LoadingAnimationLayer.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/11.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "LoadingAnimationLayer.h"
#import <UIKit/UIKit.h>
#import "UIColor+EasyWay.h"

static CGFloat const lineLength = 16;
static CGFloat const lineWidth = 4;
static CGFloat const lineSpace = 2;
static CGFloat const circleRadius = 75;

@interface LoadingAnimationLayer (){
    CGFloat lastProgress;
}

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation LoadingAnimationLayer

- (instancetype)init {
    
    if (self = [super init]) {
        
        lastProgress = 0;
        [self modifyCircles];
    }
    return self;
}

- (void)modifyCircles {
    
    //背景刻度表
    CAShapeLayer *shapeLayer = [self createProgressCircleWithLineColor:[UIColor colorWithRGB:0xf5f5f5]];
    [self addSublayer:shapeLayer];
    
    self.progressLayer = [self createProgressCircleWithLineColor:[UIColor colorWithRGB:0xcfab80]];
    [self addSublayer:self.progressLayer];
}

- (CAShapeLayer *)createProgressCircleWithLineColor:(UIColor *)color {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:color.CGColor];
    [shapeLayer setLineWidth:lineLength];
    [shapeLayer setLineJoin:kCALineCapRound];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineWidth], [NSNumber numberWithInt:lineSpace], nil]];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, circleRadius + lineLength / 2, circleRadius + lineLength / 2, circleRadius, -M_PI_2, M_PI * 1.5, 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    return shapeLayer;
}

- (void)setProgress:(CGFloat)progress {
    
    _progress = progress;
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani.fromValue = [NSNumber numberWithFloat:lastProgress];
    ani.toValue = [NSNumber numberWithFloat:_progress];
    ani.fillMode = kCAFillModeForwards;
    ani.duration = 2.0 * fabs(lastProgress - _progress);
    ani.removedOnCompletion = NO;
    [self.progressLayer addAnimation:ani forKey:@"A"];
    lastProgress = _progress;
}

@end
