//
//  ChartView.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ChartView.h"
#import "UIColor+EasyWay.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ChartDetailView.h"

static NSInteger const kPointTag = 10086;
static CGFloat const detailDistanceToPoint = 14 + 8 + 58;

@interface ChartView ()<UIGestureRecognizerDelegate>{
    
    NSArray<NSNumber *> *yAxisNumbers;      //y轴数值
    NSArray<id<ChartViewTimeProtocol>> *xAxisNumbers;      //x轴数值
    NSMutableArray<UIImageView *> *points;  //所有的圆点
    NSMutableArray<NSNumber *> *centerYs;   //所有圆点的y坐标，用于提供折线动画的路径
    UIImageView *movingPoint;               //选中的圆点,选中依据为是否在点的半径10以内
    CAShapeLayer *pathLayer;                //折线动画层
    NSMutableArray<UILabel *> *xAxisLabels;
    NSMutableArray<UILabel *> *yAxisLabels;
}
@property (nonatomic, strong) UIView *chartContentView;
@property (nonatomic, strong) ChartDetailView *detailView;

@end

@implementation ChartView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        yAxisNumbers = @[@16, @20, @24, @28, @32];
        @weakify(self);
        [[RACObserve(self, infos) deliverOnMainThread] subscribeNext:^(NSArray<id<ChartViewContentProtocol>> *x) {
            
            @strongify(self);
            self->xAxisNumbers = [[x.rac_sequence map:^id(id<ChartViewContentProtocol> value) {
                
                return value.time;
            }] array];
        }];
        [self makeDefaultData];
        
        self.backgroundColor = [UIColor colorWithRGB:0xffffff];
        [self addSubview:self.chartContentView];
        self.chartContentView.backgroundColor = [UIColor colorWithRGB:0xffffff];
        
        [self addAxisNumbers];
        [self addAxisUnits];
        [self addPoints];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressEvent:)];
        longPress.minimumPressDuration = 0;
        longPress.delegate = self;
        longPress.cancelsTouchesInView = NO;
        [self.chartContentView addGestureRecognizer:longPress];
    }
    return self;
}

- (void)makeDefaultData {
    
    NSMutableArray *multiInfos = [[NSMutableArray alloc] init];
    NSArray *defaultHours = @[@23, @0, @1, @2, @3];
    for (NSInteger i = 0; i < 5; i++) {
        ChartViewContentModel *model = [[ChartViewContentModel alloc] init];
        model.type = BLHealthySleepWindSpeedTypeSlow;
        model.temperature = @25;
        ChartViewTimeModel *timeModel = [[ChartViewTimeModel alloc] init];
        timeModel.hour = [defaultHours objectAtIndex:i];
        timeModel.minute = @0;
        model.time = timeModel;
        [multiInfos addObject:model];
    }
    self.infos = [multiInfos copy];
}

#pragma mark - 更改X轴数值
- (void)changeXAxisNumberRangeBeginWith:(id<ChartViewTimeProtocol>)beginTime endWith:(id<ChartViewTimeProtocol>)endTime {

//    [self makeDefaultData];
    NSInteger minutes = 0;
    if (beginTime.hour < endTime.hour) {
        
        minutes += 60 - beginTime.minute.integerValue;
        minutes += endTime.minute.integerValue;
        minutes += (endTime.hour.integerValue - beginTime.hour.integerValue - 1) * 60;
    }else {
        
        minutes += 60 - beginTime.minute.integerValue;
        minutes += (24 - beginTime.hour.integerValue - 1 + endTime.hour.integerValue) * 60;
        minutes += endTime.minute.integerValue;
    }
    
    NSInteger minuteSection = minutes / 4;
    
    for (NSInteger i = 0; i < self.infos.count; i++) {
        if (i == 0) {
            
            self.infos.firstObject.time = beginTime;
        }else if (i == self.infos.count - 1) {
            
            self.infos.lastObject.time = endTime;
        }else {
            
            NSInteger remainMinute = minuteSection * i + beginTime.minute.integerValue;
            NSInteger hourIncrease = remainMinute / 60;
            NSInteger currentMinute = remainMinute % 60;
            NSInteger currentHour = (beginTime.hour.integerValue + hourIncrease) % 24;
            
            [self.infos objectAtIndex:i].time.hour = [NSNumber numberWithInteger:currentHour];
            [self.infos objectAtIndex:i].time.minute = [NSNumber numberWithInteger:currentMinute];
        }
    }
    
    [self addAxisNumbers];
    [self addPoints];
}

//处理button的点击事件被手势覆盖
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isKindOfClass:[UIButton class]] || [touch.view isKindOfClass:[ChartDetailView class]]) {
        return NO;
    }
    return YES;
}

#pragma mark - 长按事件
- (void)longPressEvent:(UILongPressGestureRecognizer *)sender {
    
    CGPoint point = [sender locationInView:self.chartContentView];
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            
            [self isInPointRange:point];
            if (movingPoint) {
                movingPoint.image = [UIImage imageNamed:@"btn_point_selected"];
            }
        }
            break;
        case UIGestureRecognizerStateChanged: {
            
            if (movingPoint) {
                
                CGFloat y = MAX(MIN(point.y, 245), 0);
                CGPoint lastPoint = CGPointMake(movingPoint.center.x, y);
                [centerYs replaceObjectAtIndex:movingPoint.tag - kPointTag withObject:[NSNumber numberWithFloat:y]];
                [UIView animateWithDuration:0.1
                                 animations:^{
                                     self->movingPoint.center = lastPoint;
                                     self.detailView.center = CGPointMake(lastPoint.x, lastPoint.y - detailDistanceToPoint);
                                 } completion:^(BOOL finished) {
                                     
                                     int length = 32 - lastPoint.y / 245.00 * (32 -16);
                                     id<ChartViewContentProtocol> content = [self.infos objectAtIndex:self->movingPoint.tag - kPointTag];
                                     content.temperature = @(length);
                                     self.detailView.content = content;
                                 }];
                [self tempPathAnimation];
            }
        }
            break;
        default: {
            
            NSLog(@"end");
        }
            break;
    }
}

- (void)isInPointRange:(CGPoint)point {
    
    BOOL inRange = NO;
    for (UIImageView *imageView in points) {
        
        CGPoint center = imageView.center;
        CGFloat distance = sqrtf(powf((point.x - center.x), 2) + powf((point.y - center.y), 2));
        if (distance < 14) {
            
            inRange = YES;
            if (movingPoint && movingPoint.tag != imageView.tag) {
                movingPoint.image = [UIImage imageNamed:@"btn_point_normal"];
                [self.detailView removeFromSuperview];
                self.detailView = nil;
            }
            movingPoint = imageView;
            if (!self.detailView) {
                self.detailView = [[ChartDetailView alloc] initWithFrame:CGRectMake(0, 0, 168, 116)];
                self.detailView.center = CGPointMake(movingPoint.center.x, movingPoint.center.y - detailDistanceToPoint);
                self.detailView.content = [self.infos objectAtIndex:(imageView.tag - kPointTag)];
                [self.chartContentView addSubview:self.detailView];
            }
            break;
        }
    }
    
    if (!inRange) {
        
        if (movingPoint) {
            movingPoint.image = [UIImage imageNamed:@"btn_point_normal"];
        }
        movingPoint = nil;
        if (self.detailView) {
            [self.detailView removeFromSuperview];
            self.detailView = nil;
        }
    }
}

#pragma mark - Animaiton
- (void)tempPathAnimation {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSInteger i = 0; i < points.count; i++) {
        if (i == 0) {
            
            CGFloat y = centerYs.firstObject.floatValue;
            CGFloat x = points.firstObject.center.x;
            [path moveToPoint:CGPointMake(x, y)];
        }else {
            
            CGFloat y = [centerYs objectAtIndex:i].floatValue;
            CGFloat x = [points objectAtIndex:i].center.x;
            [path addLineToPoint:CGPointMake(x, y)];
        }
    }
    
    CABasicAnimation *animaiton = [CABasicAnimation animationWithKeyPath:@"path"];
    animaiton.duration = 0.1;
    animaiton.fromValue = (__bridge id _Nullable)(pathLayer.path);
    animaiton.toValue = (__bridge id _Nullable)path.CGPath;
    pathLayer.path = path.CGPath;
    animaiton.removedOnCompletion = NO;
    [pathLayer addAnimation:animaiton forKey:@"linePath"];
}

#pragma mark - UI
- (UIView *)chartContentView {
    
    if (!_chartContentView) {
        _chartContentView = [[UIView alloc] initWithFrame:CGRectMake(39, 85, ScreenWidth - 70, 245)];
        for (NSInteger i = 0; i < yAxisNumbers.count; i++) {
            
            CGFloat horiX = (ScreenWidth - 70) / 2;
            CGFloat horiY = 0.5 + 61 * i;
            CALayer *line = [self chartLineWithDirectionHori:YES position:CGPointMake(horiX, horiY)];
            [_chartContentView.layer addSublayer:line];
        }
        for (NSInteger i = 0; i < xAxisNumbers.count; i++) {
            
            CGFloat cellWidth = (ScreenWidth - 70 - 5) / 4;
            CGFloat horiX = 0.5 + (cellWidth + 1) * i;
            CGFloat horiY = 245 / 2;
            CALayer *line = [self chartLineWithDirectionHori:NO position:CGPointMake(horiX, horiY)];
            [_chartContentView.layer addSublayer:line];
        }
    }
    return _chartContentView;
}

- (void)addAxisNumbers {
    
    if (yAxisLabels && yAxisLabels.count == yAxisNumbers.count) {
        
        [yAxisLabels enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            obj.text = [NSString stringWithFormat:@"%@", [self->yAxisNumbers objectAtIndex:self->yAxisNumbers.count - idx - 1]];
        }];
    }else {
        
        yAxisLabels = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < yAxisNumbers.count; i++) {
            UILabel *label = [self axisNumbersLabelWithFrame:CGRectMake(0, 85 + 61 * i - 9 , 39, 18)
                                                        text:[NSString stringWithFormat:@"%@", [yAxisNumbers objectAtIndex:yAxisNumbers.count - i - 1]]];
            [yAxisLabels addObject:label];
            [self addSubview:label];
        }
    }
    
    if (xAxisLabels && xAxisLabels.count == xAxisNumbers.count) {
        
        [xAxisLabels enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            obj.text = [NSString stringWithFormat:@"%02d:%02d", [self->xAxisNumbers objectAtIndex:idx].hour.intValue, [self->xAxisNumbers objectAtIndex:idx].minute.intValue];
        }];
    }else {
        
        xAxisLabels = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < xAxisNumbers.count; i++) {
            CGFloat cellWidth = (ScreenWidth - 70 - 5) / 4;
            NSString *time = [NSString stringWithFormat:@"%02d:%02d", [xAxisNumbers objectAtIndex:i].hour.intValue, [xAxisNumbers objectAtIndex:i].minute.intValue];
            UILabel *label = [self axisNumbersLabelWithFrame:CGRectMake(39 + cellWidth * (i - 0.5), CGRectGetMaxY(self.chartContentView.frame) + 13, cellWidth, 18)
                                                        text:time];
            [xAxisLabels addObject:label];
            [self addSubview:label];
        }
    }
}

- (void)addAxisUnits {
    
    UILabel *yAxisUnitLabel = [self axisNumbersLabelWithFrame:CGRectMake(0, 59, 39, 17)
                                                         text:@"(℃)"];
    [self addSubview:yAxisUnitLabel];
    
    /*
     UILabel *xAxisUnitLabel = [self axisNumbersLabelWithFrame:CGRectMake(ScreenWidth - 15 -8, 338 + 5, 20, 17)
     text:@"(h)"];
     [self addSubview:xAxisUnitLabel];
     */
}

- (void)addPoints {
    
    for (UIView *view in self.chartContentView.subviews) {
        
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
    if (pathLayer) {
        
        [pathLayer removeFromSuperlayer];
        pathLayer = nil;
    }
    
    if (self.detailView) {
        
        [self.detailView removeFromSuperview];
        self.detailView = nil;
    }
    
    
    NSArray<NSNumber *> *temps = [[self.infos.rac_sequence map:^id(id<ChartViewContentProtocol> value) {
        
        return value.temperature;
    }] array];
    points = [[NSMutableArray alloc] init];
    centerYs = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < temps.count; i++) {
        
        CGFloat temp = [temps objectAtIndex:i].floatValue;
        CGFloat y = (1 - (temp - yAxisNumbers.firstObject.floatValue) / 16.0) * 245;
        CGFloat x = 0.5 + ((ScreenWidth - 70 - 5) / 4 + 1) * i;
        
        UIImageView *point = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
        point.center = CGPointMake(x, y);
        point.image = [UIImage imageNamed:@"btn_point_normal"];
        point.tag = kPointTag + i;
        
        [points addObject:point];
        [centerYs addObject:[NSNumber numberWithFloat:y]];
    }
    
    [self addTemperaturePath];
    
    for (UIImageView *imageView in points) {
        [self.chartContentView addSubview:imageView];
    }
}

- (void)addTemperaturePath {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSInteger i = 0; i < points.count; i++) {
        if (i == 0) {
            
            CGFloat y = centerYs.firstObject.floatValue;
            CGFloat x = points.firstObject.center.x;
            [path moveToPoint:CGPointMake(x, y)];
        }else {
            
            CGFloat y = [centerYs objectAtIndex:i].floatValue;
            CGFloat x = [points objectAtIndex:i].center.x;
            [path addLineToPoint:CGPointMake(x, y)];
        }
    }
    
    pathLayer = [CAShapeLayer layer];
    pathLayer.lineWidth = 1;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor colorWithRGB:0x57A6FF].CGColor;
    pathLayer.path = path.CGPath;
    [self.chartContentView.layer addSublayer:pathLayer];

}

- (CALayer *)chartLineWithDirectionHori:(BOOL)hori position:(CGPoint)position{
    
    CALayer *line = [[CALayer alloc] init];
    if (hori) {
        
        line.frame = CGRectMake(0, 0, ScreenWidth - 70, 1);
    }else {
        
        line.frame = CGRectMake(0, 0, 1, 245);
    }
    line.backgroundColor = [UIColor colorWithRGB:0xeeeeee].CGColor;
    [line setPosition:position];
    return line;
}

- (CAShapeLayer *)circleInPoint {
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor colorWithRGB:0xffffff].CGColor;
    layer.strokeColor = [UIColor colorWithRGB:0x57A6FF].CGColor;
    layer.lineWidth = 1;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 14, 14, 4.5, -M_PI_2, M_PI * 1.5, 0);
    
    [layer setPath:path];
    CGPathRelease(path);
    
    return layer;
}

- (UILabel *)axisNumbersLabelWithFrame:(CGRect)frame text:(NSString *)text {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = [UIColor colorWithRGB:0x666666];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
@end

#pragma mark - Models
@implementation ChartViewContentModel

@synthesize temperature;
@synthesize time;
@synthesize type;

@end

@implementation ChartViewTimeModel

@synthesize hour;
@synthesize minute;

@end
