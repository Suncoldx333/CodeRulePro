//
//  TouchCustomizeView.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/25.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TouchCustomizeView.h"

@implementation TouchCustomizeView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!self.isUserInteractionEnabled|| self.isHidden || self.alpha <= 0) {
        
        return nil;
    }
    CGRect touchRect = CGRectInset(self.bounds, -25, 0);
    if (CGRectContainsPoint(touchRect, point)) {
        
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertPoint withEvent:event];
            if (hitTestView) {
                
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

@end

@implementation TouchCustomizeSubView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!self.isUserInteractionEnabled|| self.isHidden || self.alpha <= 0) {
        
        return nil;
    }
    CGRect touchRect = CGRectInset(self.bounds, -10, -10);
    if (CGRectContainsPoint(touchRect, point)) {
        
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertPoint withEvent:event];
            if (hitTestView) {
                
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

@end
