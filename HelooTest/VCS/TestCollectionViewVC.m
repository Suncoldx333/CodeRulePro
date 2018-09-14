//
//  TestCollectionViewVC.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/3.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TestCollectionViewVC.h"
#import "ModifyCell.h"
#import "CustomizeLayout.h"

static NSString * const scenListcellId = @"scenListcellId";

@interface TestCollectionViewVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, BLRearangeableCollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) CustomizeLayout *layout;
@end

@implementation TestCollectionViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.button];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        self.layout = [[CustomizeLayout alloc] init];

        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 667 - 45 - 64)
                                                      collectionViewLayout:self.layout];
        self.layout.isLongTapEnable = YES;
        self.layout.editable = YES;
        self.layout.draggable = YES;
        _collectionView.backgroundColor = [self colorWithRGB:0x111111];
        [_collectionView registerClass:[ModifyCell class] forCellWithReuseIdentifier:scenListcellId];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UIButton *)button {
    
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), 375, 45)];
        [_button setBackgroundColor:[UIColor lightGrayColor]];
        [_button addTarget:self action:@selector(changeEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)changeEvent {
    
    [self.layout enterEditing];
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ModifyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:scenListcellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"select");
}

- (void)rearangeableMoveItemFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (UIColor *)colorWithRGB:(uint32_t)rgbValue {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:1];
}

@end
