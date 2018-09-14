//
//  ModifyCell.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/3.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ModifyCell.h"

@implementation ModifyCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
//        button.layer.cornerRadius = 12.5;
//        [button setBackgroundColor:[UIColor lightGrayColor]];
//        [button addTarget:self action:@selector(showTapped) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:button];
    }
    return self;
}

- (void)showTapped {
    
    NSLog(@"tapped");
}

@end
