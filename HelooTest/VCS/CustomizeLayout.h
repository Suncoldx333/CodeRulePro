//
//  CustomizeLayout.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/3.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BLRearangeableCollectionViewDelegate <UICollectionViewDelegateFlowLayout>

- (void)rearangeableMoveItemFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)indexPath;

@end

@interface CustomizeLayout : UICollectionViewFlowLayout

@property (nonatomic, readonly) BOOL isEditing;
@property (nonatomic, assign) BOOL draggable;
@property (nonatomic, assign) BOOL editable;
@property (nonatomic, assign) BOOL isTapEndEditing;
@property (nonatomic, assign) BOOL isLongTapEnable;
- (void)enterEditing;
- (void)endEditing;
- (void)restartShakeCell;

@end
