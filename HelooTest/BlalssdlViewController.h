//
//  BlalssdlViewController.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2019/3/22.
//  Copyright © 2019年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BlalssdlViewController;
@protocol BlalssdlViewControllerDelegate <NSObject>

- (void)sayHello;

@end

@interface BlalssdlViewController : UIViewController

@property (nonatomic, weak) id<BlalssdlViewControllerDelegate> delegate;

@end
