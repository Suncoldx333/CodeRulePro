//
//  ImageInLayerViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/10/8.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ImageInLayerViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ImageInLayerViewController ()

@end

@implementation ImageInLayerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (void)initUI {
    
    CALayer *show = [[CALayer alloc] init];
    show.frame = CGRectMake(100, 100, 100, 50);
    show.contents = (__bridge id _Nullable)([UIImage imageNamed:@"btn_point_selected"].CGImage);
    show.contentsGravity = kCAGravityResizeAspect;
    show.borderColor = [UIColor colorWithRGB:0x111111].CGColor;
    show.borderWidth = 1;
    [self.view.layer addSublayer:show];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"sdfsfs"]];
}

@end
