//
//  ChartDetailView.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ChartDetailView.h"
#import "UIColor+EasyWay.h"

static CGFloat const rectangleWidth = 168;
static CGFloat const rectangleHeight = 110;
static CGFloat const rectangleCornerRadius = 4;
static CGFloat const triangleWidth = 11;
static CGFloat const triangleHeight = 6;

@interface ChartDetailView (){
    CGFloat widthUnit;
}

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *windModeView;

@end

@implementation ChartDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.winds = @[@"自动", @"低风", @"中风", @"高风"];
        self.currentIndex = 0;
        widthUnit = MAX(CGRectGetWidth(self.frame) - 90, 0);

        self.backgroundColor = [UIColor clearColor];
        [self irregularityShape];
        [self addSubview:self.label];
        self.label.text = @"26℃";
        [self addSubview:self.windModeView];
        self.windModeView.clipsToBounds = YES;
        self.windModeView.userInteractionEnabled = NO;
        self.windModeView.bounds = CGRectMake(widthUnit * self.currentIndex, 0, widthUnit, 22);
        
        UIButton *left = [[UIButton alloc] initWithFrame:CGRectMake(21, 67, 24, 24)];
        [left setImage:[UIImage imageNamed:@"icon_sleep_arrow_left"] forState:UIControlStateNormal];
        [left addTarget:self action:@selector(leftSwitchEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:left];
        
        UIButton *right = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - 45, 67, 24, 24)];
        [right setImage:[UIImage imageNamed:@"icon_sleep_arrow_right"] forState:UIControlStateNormal];
        [right addTarget:self action:@selector(rightSwitchEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:right];
        
    }
    return self;
}

- (void)irregularityShape {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(rectangleCornerRadius, 0)];
    [path addLineToPoint:CGPointMake(rectangleWidth - rectangleCornerRadius, 0)];
    [path addArcWithCenter:CGPointMake(rectangleWidth - rectangleCornerRadius, rectangleCornerRadius) radius:rectangleCornerRadius startAngle:-M_PI_2 endAngle:0 clockwise:1];
    [path addLineToPoint:CGPointMake(rectangleWidth, rectangleHeight - rectangleCornerRadius)];
    [path addArcWithCenter:CGPointMake(rectangleWidth - rectangleCornerRadius, rectangleHeight - rectangleCornerRadius) radius:rectangleCornerRadius startAngle:0 endAngle:M_PI_2 clockwise:1];
    [path addLineToPoint:CGPointMake((rectangleWidth + triangleWidth) / 2, rectangleHeight)];
    [path addLineToPoint:CGPointMake(rectangleWidth / 2, rectangleHeight + triangleHeight)];
    [path addLineToPoint:CGPointMake((rectangleWidth - triangleWidth) / 2, rectangleHeight)];
    [path addLineToPoint:CGPointMake(rectangleCornerRadius, rectangleHeight)];
    [path addArcWithCenter:CGPointMake(rectangleCornerRadius, rectangleHeight - rectangleCornerRadius) radius:rectangleCornerRadius startAngle:M_PI_2 endAngle:M_PI clockwise:1];
    [path addLineToPoint:CGPointMake(0, rectangleCornerRadius)];
    [path addArcWithCenter:CGPointMake(rectangleCornerRadius, rectangleCornerRadius) radius:rectangleCornerRadius startAngle:M_PI endAngle:M_PI_2 * 3 / 2 clockwise:1];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor colorWithRGB:0x57A6FF].CGColor;
    layer.path = path.CGPath;
    
    [self.layer addSublayer:layer];
    
    CALayer *line = [[CALayer alloc] init];
    line.frame = CGRectMake(0, 52, CGRectGetWidth(self.frame), 1);
    line.backgroundColor = [[UIColor colorWithRGB:0xffffff] colorWithAlphaComponent:0.53].CGColor;
    [self.layer addSublayer:line];
}

- (void)setContent:(id<ChartViewContentProtocol>)content {
    
    _content = content;
    self.label.text = [NSString stringWithFormat:@"%@", content.temperature];
    self.currentIndex = content.type;
    self.windModeView.bounds = CGRectMake(widthUnit * self.currentIndex, 0, widthUnit, 22);
}

#pragma mark -
- (void)leftSwitchEvent {
    
    self.currentIndex = MIN(self.currentIndex + 1, self.winds.count - 1);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.windModeView.bounds = CGRectMake(self->widthUnit * self.currentIndex, 0, self->widthUnit, 22);
                     }
                     completion:^(BOOL finished) {
                         
                         self.content.type = self.currentIndex;
                     }];
}

- (void)rightSwitchEvent {
    
    self.currentIndex = MAX(self.currentIndex - 1, 0);
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.windModeView.bounds = CGRectMake(self->widthUnit * self.currentIndex, 0, self->widthUnit, 22);
                     }
                     completion:^(BOOL finished) {
                         
                         self.content.type = self.currentIndex;
                     }];
}

#pragma mark -
- (UILabel *)label {
    
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, CGRectGetWidth(self.frame), 22)];
        _label.textColor = [UIColor colorWithRGB:0xffffff];
        _label.font = [UIFont systemFontOfSize:16];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIView *)windModeView {
    
    if (!_windModeView) {
        _windModeView = [[UIView alloc] initWithFrame:CGRectMake(45, 67, widthUnit, 22)];
        for (NSInteger i = 0; i < self.winds.count; i++) {
            UILabel *windLabel = [[UILabel alloc] initWithFrame:CGRectMake(widthUnit * i, 0, widthUnit, 22)];
            windLabel.text = [self.winds objectAtIndex:i];
            windLabel.textColor = [UIColor colorWithRGB:0xffffff];
            windLabel.font = [UIFont systemFontOfSize:16];
            windLabel.textAlignment = NSTextAlignmentCenter;
            [_windModeView addSubview:windLabel];
        }
    }
    return _windModeView;
}

@end
