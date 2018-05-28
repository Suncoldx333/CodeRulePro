//
//  CRTestViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/28.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "CRTestViewController.h"

@interface CRTestViewController ()
@property (nonatomic, copy) NSString *    p;
@property (nonatomic, strong) UITextView *textview;
@end

@implementation CRTestViewController

- (void)formatTest:(NSString *)param {
    if (param) {
        NSLog(@"sss");
    }
    int a = 0;
    int b = 1;
    int c = 2;
    NSLog(@"%d%d%d", a, b, c);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
