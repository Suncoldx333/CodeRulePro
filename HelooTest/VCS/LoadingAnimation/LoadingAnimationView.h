//
//  LoadingAnimationView.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/11.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingAnimationView : UIView

@property (nonatomic, assign) CGFloat progress;
/**
 计时时间,默认100秒
 */
@property (nonatomic, assign) NSTimeInterval totoalTime;

/**
 计时自动结束回调
 */
@property (nonatomic, copy) void(^timeIsUpBlock)(void);
- (void)startAnimation;
- (void)startAnimationWithProgress:(CGFloat)progress;
- (void)stopAniamiton;
- (void)pauseAnimation;

@end
