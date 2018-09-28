//
//  CustonVC.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/7/4.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HELLOBLOCK)(NSString *code);

@interface CustonVC : UIViewController

@property (nonatomic, copy) HELLOBLOCK block;

@end
