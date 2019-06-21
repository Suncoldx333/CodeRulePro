//
//  UIImage+Cut.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2019/5/8.
//  Copyright © 2019 ZhaoyunWang. All rights reserved.
//

#import "UIImage+Cut.h"

@implementation UIImage (Cut)

- (NSData *)convertToNSDataWithMaxLimit:(NSNumber *)maxLimitDataSize isPng:(BOOL)ifPng{
    
    NSData *imageData;
    if (ifPng) {
        imageData = UIImagePNGRepresentation(self);
    }else {
        imageData = UIImageJPEGRepresentation(self, 0);
    }
    double   factor       = 1.0;
    double   adjustment   = 1.0 / sqrt(2.0);
    CGSize   size         = self.size;
    CGSize   currentSize  = size;
    UIImage *currentImage = self;
    
    
    while (imageData.length >= [maxLimitDataSize longLongValue]) {
        @autoreleasepool {
            factor      *= adjustment;
            currentSize  = CGSizeMake(roundf(size.width * factor), roundf(size.height * factor));
            currentImage = [currentImage convertToSize: currentSize];
            if (ifPng) {
                imageData = UIImagePNGRepresentation(currentImage);
            }else {
                imageData = UIImageJPEGRepresentation(currentImage, 0);
            }
        }
    }
    return imageData;
}

- (UIImage *)convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

@end
