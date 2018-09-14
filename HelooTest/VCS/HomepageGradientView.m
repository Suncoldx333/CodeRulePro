//
//  HomepageGradientView.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/13.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "HomepageGradientView.h"

@implementation HomepageGradientView

- (void)drawRect:(CGRect)rect {
    
    CGGradientRef gradientRef;
    CGColorSpaceRef colorSpaceRef;
    CGFloat locations[] = {0, 1};
    CGFloat colors[] = {
        0.04, 0.04, 0.04, 1,
        0.75, 0.75, 0.75, 1
    };
    colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    gradientRef = CGGradientCreateWithColorComponents(colorSpaceRef,
                                                      colors,
                                                      locations,
                                                      2);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextDrawRadialGradient(contextRef,
                                gradientRef,
                                CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2),
                                rect.size.width / 2,
                                CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2),
                                0,
                                0);
}

@end
