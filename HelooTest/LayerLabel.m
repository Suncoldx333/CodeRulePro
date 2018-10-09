//
//  LayerLabel.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/10/9.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "LayerLabel.h"

@implementation LayerLabel
- (instancetype)init {
    
    if (self = [super init]) {
        
        self.contentsScale = [UIScreen mainScreen].scale;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super init]) {
        
        self.frame = frame;
        self.contentsScale = [UIScreen mainScreen].scale;
    }
    return self;
}

#pragma mark - SETTER
- (void)setText:(NSString *)text {
    
    _text = text;
    self.string = _text;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    _attributedText = attributedText;
    self.string = attributedText;
}

- (void)setTextColor:(UIColor *)textColor {
    
    _textColor = textColor;
    self.foregroundColor = _textColor.CGColor;
}

- (void)setTextFont:(UIFont *)textFont {
    
    _textFont = textFont;
    self.font = (__bridge CFTypeRef _Nullable)(textFont.fontName);
    self.fontSize = textFont.pointSize;
}

- (void)setAlignment:(NSTextAlignment)alignment {
    
    _alignment = alignment;
    NSString *alignMent = kCAAlignmentLeft;
    switch (_alignment) {
        case NSTextAlignmentCenter:
            alignMent = kCAAlignmentCenter;
            break;
        case NSTextAlignmentRight:
            alignMent = kCAAlignmentRight;
            break;
        case NSTextAlignmentNatural:
            alignMent = kCAAlignmentNatural;
            break;
        case NSTextAlignmentJustified:
            alignMent = kCAAlignmentJustified;
            break;
        default:
            break;
    }
    self.alignmentMode = alignMent;
}

@end
