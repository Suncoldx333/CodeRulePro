//
//  LayerLabel.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/10/9.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/NSText.h>

@interface LayerLabel : CATextLayer

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSAttributedString *attributedText;
@property (nonatomic, assign) NSTextAlignment alignment;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;

- (instancetype)initWithFrame:(CGRect)frame;

@end
