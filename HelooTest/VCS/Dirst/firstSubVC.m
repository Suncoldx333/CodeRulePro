//
//  firstSubVC.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/22.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "firstSubVC.h"

@interface firstSubVC ()

@end

@implementation firstSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeVC)];
    [self.view addGestureRecognizer:tap];
}

- (void)changeVC {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BL_Region_Set_Finished" object:nil userInfo:nil];
}

@end
