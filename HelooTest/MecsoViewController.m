//
//  MecsoViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2019/3/22.
//  Copyright © 2019年 ZhaoyunWang. All rights reserved.
//

#import "MecsoViewController.h"
#import "BlalssdlViewController.h"

@interface MecsoViewController ()

@end

@implementation MecsoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"2_VC";
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BlalssdlViewController *vc = [[BlalssdlViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    NSMutableArray *naviVCsArr = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    for (UIViewController *vc in naviVCsArr) {
        if ([vc isKindOfClass:[self class]]) {
            [naviVCsArr removeObject:vc];
            break;
        }
    }
    self.navigationController.viewControllers = naviVCsArr;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
