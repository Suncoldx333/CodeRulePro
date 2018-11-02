//
//  SearchViewController.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/1.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewControllerDelegate <NSObject>

- (void)shouldUpdateResultsController:(NSString *)keyword;

@end

@interface SearchViewController : UIViewController

+ (SearchViewController *)viewControllerWithMainViewController:(nonnull UIViewController *)mainVC
                                       SearchResultsController:(nonnull UIViewController *)result;

@property (nonatomic, weak) id<SearchViewControllerDelegate> delegate;

@end
