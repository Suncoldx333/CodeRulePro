//
//  LoadingAnimationView.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/11.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "LoadingAnimationView.h"
#import "UIColor+EasyWay.h"

static CGFloat const lineLength = 16;
static CGFloat const lineWidth = 4;
static CGFloat const lineSpace = 2;
static CGFloat const circleRadius = 75;
static NSInteger const progressingDuration = 100;

@interface LoadingAnimationView (){
    CGFloat lastProgress;
    CGPoint center;
    NSInteger count;
}

@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *dynamicLines;

@end

@implementation LoadingAnimationView

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, 230, 230);
        
        center = CGPointMake(115, 115);
        count = 0;
        lastProgress = 0.00;
        self.dynamicLines = [[NSMutableArray alloc] init];
        
        [self addProgressCircle];
        [self addStaticLine];
        [self addDynamicLine];
        [self addSubview:self.progressLabel];
    }
    return self;
}

#pragma mark -
-(void)startAnimation {
    
    [self startAnimationWithProgress:lastProgress];
    [self resumeLayers:self.dynamicLines];
}

- (void)pauseAnimation {
    
    if (self.timer) {
        
        [self.timer invalidate];
        self.timer = nil;
    }
    [self pauseLayers:self.dynamicLines];
}

- (void)stopAniamiton {
    
    if (self.timer) {
        
        [self.timer invalidate];
        self.timer = nil;
    }
    lastProgress = 0;
    count = 0;
}

- (void)startAnimationWithProgress:(CGFloat)progress {
    
    self.progress = progress;
    count = progress * (self.totoalTime ?: progressingDuration);
    
    if (self.timer) {
        
        [self.timer invalidate];
        self.timer = nil;
    }
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:weakSelf
                                                selector:@selector(changeProgress)
                                                userInfo:nil
                                                 repeats:YES];
}

#pragma mark -
- (void)pauseLayers:(NSArray<CALayer *> *)layers {
    
    for (CALayer *layer in layers) {
        
        CFTimeInterval pauseTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
        layer.speed = 0.0;
        layer.timeOffset = pauseTime;
    }
}

- (void)resumeLayers:(NSArray<CALayer *> *)layers {
    
    for (CALayer *layer in layers) {
        
        CFTimeInterval pausedTime = [layer timeOffset];
        layer.speed = 1.0;
        layer.timeOffset = 0.0;
        layer.beginTime = 0.0;
        CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        layer.beginTime = timeSincePause;
    }
}

- (void)changeProgress {
    
    if (count < (self.totoalTime ?: progressingDuration)) {
        
        count++;
        self.progress = count / ((self.totoalTime ?: progressingDuration) * 1.00);
    }else {
        
        if (self.timeIsUpBlock) {
            self.timeIsUpBlock();
        }
        [self stopAniamiton];
    }
}

- (void)setProgress:(CGFloat)progress {
    
    _progress = progress;
    
    //Animation 动画时间待确认
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani.fromValue = [NSNumber numberWithFloat:lastProgress];
    ani.toValue = [NSNumber numberWithFloat:_progress];
    ani.fillMode = kCAFillModeForwards;
    ani.duration = 1.0 * fabs(lastProgress - _progress);
    ani.removedOnCompletion = NO;
    [self.progressLayer addAnimation:ani forKey:@"A"];
    
    //Lable 文案展示待确认
    NSString *progressStr = [NSString stringWithFormat:@"%.f%%", _progress * 100];
    self.progressLabel.text = progressStr;
    
    lastProgress = _progress;
}

#pragma mark -
- (UILabel *)progressLabel {
    
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 230, 230)];
        _progressLabel.textColor = [UIColor colorWithRGB:0xcfab80];
        _progressLabel.font = [UIFont systemFontOfSize:24];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.text = @"0%";
    }
    return _progressLabel;
}

- (void)addProgressCircle {
    
    //背景刻度表
    CAShapeLayer *shapeLayer = [self createProgressCircleWithLineColor:[UIColor colorWithRGB:0xf5f5f5]];
    [self.layer addSublayer:shapeLayer];
    
    self.progressLayer = [self createProgressCircleWithLineColor:[UIColor colorWithRGB:0xcfab80]];
    [self.layer addSublayer:self.progressLayer];
}

- (void)addStaticLine {
    
    CAShapeLayer *line1 = [self customizeShapeLayerWithColor:[UIColor colorWithRGB:0x999999]
                                                   lineWidth:1
                                                      radius:60
                                                   fromAngle:-M_PI_2
                                                     toAngle:M_PI * 1.5
                                                   clockwise:YES];
    [self.layer addSublayer:line1];
    
    CAShapeLayer *line2 = [self customizeShapeLayerWithColor:[UIColor colorWithRGB:0x999999]
                                                   lineWidth:1
                                                      radius:92
                                                   fromAngle:-M_PI_2
                                                     toAngle:M_PI * 1.5
                                                   clockwise:YES];
    [self.layer addSublayer:line2];
}

- (void)addDynamicLine {
    
    CAShapeLayer *line1 = [self customizeShapeLayerWithColor:[UIColor colorWithRGB:0x999999]
                                                   lineWidth:3
                                                      radius:100
                                                   fromAngle:0
                                                     toAngle:M_PI_2
                                                   clockwise:NO];
    [self.layer addSublayer:line1];
    CABasicAnimation *ani1 = [self rotationAnimationWithDuration:2.0 clockwise:NO];
    [line1 addAnimation:ani1 forKey:@"line1"];
    
    CAShapeLayer *line2 = [self customizeShapeLayerWithColor:[UIColor colorWithRGB:0x999999]
                                                   lineWidth:5
                                                      radius:107.5
                                                   fromAngle:-M_PI_2
                                                     toAngle:M_PI_2
                                                   clockwise:YES];
    [self.layer addSublayer:line2];
    CABasicAnimation *ani2 = [self rotationAnimationWithDuration:2.5 clockwise:YES];
    [line2 addAnimation:ani2 forKey:@"line2"];
    
    CAShapeLayer *line3 = [self customizeShapeLayerWithColor:[UIColor colorWithRGB:0x999999]
                                                   lineWidth:5
                                                      radius:107.5
                                                   fromAngle:M_PI
                                                     toAngle:M_PI * 1.2
                                                   clockwise:YES];
    [self.layer addSublayer:line3];
    CABasicAnimation *ani3 = [self rotationAnimationWithDuration:2.5 clockwise:YES];
    [line3 addAnimation:ani3 forKey:@"line3"];
    
    CAShapeLayer *line4 = [self customizeShapeLayerWithColor:[UIColor colorWithRGB:0x999999]
                                                   lineWidth:1
                                                      radius:109.5
                                                   fromAngle:M_PI * 0.75
                                                     toAngle:M_PI * 1.3
                                                   clockwise:YES];
    [self.layer addSublayer:line4];
    CABasicAnimation *ani4 = [self rotationAnimationWithDuration:2.5 clockwise:YES];
    [line4 addAnimation:ani4 forKey:@"line4"];
    
    [self.dynamicLines addObject:line1];
    [self.dynamicLines addObject:line2];
    [self.dynamicLines addObject:line3];
    [self.dynamicLines addObject:line4];
    
}

#pragma mark -
- (CAShapeLayer *)createProgressCircleWithLineColor:(UIColor *)color {
    
    CAShapeLayer *shapeLayer = [self customizeShapeLayerWithColor:color
                                                        lineWidth:lineLength
                                                           radius:circleRadius
                                                        fromAngle:-M_PI_2
                                                          toAngle:M_PI * 1.5
                                                        clockwise:YES];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineWidth], [NSNumber numberWithInt:lineSpace], nil]];
    return shapeLayer;
}

- (CABasicAnimation *)rotationAnimationWithDuration:(CGFloat)duration clockwise:(BOOL)clockwise {
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    if (clockwise) {
        ani.fromValue = @(-M_PI_2);
        ani.toValue = @(M_PI * 1.5);
    }else {
        ani.fromValue = @(M_PI * 1.5);
        ani.toValue = @(-M_PI_2);
    }
    
    ani.fillMode = kCAFillModeForwards;
    ani.duration = duration;
    ani.removedOnCompletion = NO;
    ani.repeatCount = HUGE_VALF;
    return ani;
}

- (CAShapeLayer *)customizeShapeLayerWithColor:(UIColor *)color
                                     lineWidth:(CGFloat)lineWidth
                                        radius:(CGFloat)radius
                                     fromAngle:(CGFloat)angle1
                                       toAngle:(CGFloat)angle2
                                     clockwise:(BOOL)clockwise {
    
    CAShapeLayer *line = [CAShapeLayer layer];
    [line setPosition:center];
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
