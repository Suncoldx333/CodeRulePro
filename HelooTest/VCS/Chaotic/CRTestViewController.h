//
//  CRTestViewController.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/28.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRTestViewController : UIViewController

@end

@interface HERegionSearchResultViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *searchResults;
@property (nonatomic, weak) UIViewController *mainSearchController;

@end

@interface RegionListSearchBar : UISearchBar

@end

@interface RegionListSearchView : UIView

@end
