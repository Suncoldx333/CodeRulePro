//
//  CustonVC.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/7/4.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "CustonVC.h"

@interface CustonVC ()

@end

@implementation CustonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOne)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapOne {
    self.block(@"yes");
}

@end
