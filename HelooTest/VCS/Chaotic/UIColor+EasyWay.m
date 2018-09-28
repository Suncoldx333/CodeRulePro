//
//  UIColor+EasyWay.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/7.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "UIColor+EasyWay.h"

@implementation UIColor (EasyWay)

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:1];
}

@end
