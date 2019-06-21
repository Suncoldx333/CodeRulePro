//
//  UIImage+Cut.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2019/5/8.
//  Copyright © 2019 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Cut)

- (NSData *)convertToNSDataWithMaxLimit:(NSNumber *)maxLimitDataSize isPng:(BOOL)ifPng;
- (UIImage *)convertToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
