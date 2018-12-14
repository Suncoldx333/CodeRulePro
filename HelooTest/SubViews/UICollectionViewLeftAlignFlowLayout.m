//
//  UICollectionViewLeftAlignFlowLayout.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "UICollectionViewLeftAlignFlowLayout.h"

@interface UICollectionViewLayoutAttributes (LeftAlign)

- (void)leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset;

@end

@implementation UICollectionViewLayoutAttributes (LeftAlign)

- (void)leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset {
    CGRect frame = self.frame;
    frame.origin.x = sectionInset.left;
    self.frame = frame;
}

@end

#pragma mark -
@implementation UICollectionViewLeftAlignFlowLayout

//- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    NSArray *originalAttributes = [super layoutAttributesForElementsInRect:rect];
//    NSMutableArray *updatedAttributes = [NSMutableArray arrayWithArray:originalAttributes];
//    return updatedAttributes;
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewLayoutAttributes *currentItemAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
//    UIEdgeInsets sectionInset = self.sectionInset;
//    
//    BOOL isFirstItemInSection = indexPath.item == 0;
//    if (isFirstItemInSection) {
//        [currentItemAttributes leftAlignFrameWithSectionInset:sectionInset];
//        return currentItemAttributes;
//    }
//    
//    NSIndexPath *previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
//    
//    
//}

@end
