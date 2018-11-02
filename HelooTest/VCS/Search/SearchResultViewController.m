//
//  SearchResultViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/1.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "SearchResultViewController.h"

static NSString *const kReuseIdentifier = @"cellReuseIdentifier";
static NSString *const kReuseHeaderIdentifier = @"cellReuseHeaderIdentifier";
static NSString *const kSearchReuseIdentifier = @"SearchCellReuseIdentifier";

@interface SearchResultViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *dataSource;

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    
    self.dataSource = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 20; i++) {
        
        [self.dataSource addObject:@(i + 100)];
    }
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSearchReuseIdentifier];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSearchReuseIdentifier];
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row].stringValue;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self.parentViewController.view endEditing:YES];
}

@end
