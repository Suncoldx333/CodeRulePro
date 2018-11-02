//
//  SearchViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/1.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "SearchViewController.h"
#import <Masonry/Masonry.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface SearchViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *searchField;
@property (nonatomic, strong) UIView *searchFieldBackgroundView;
@property (nonatomic, strong) UIButton *searchCancelButton;
@property (nonatomic, strong) UIView *searchMaskView;

@property (nonatomic, strong) UIViewController *mainVC;
@property (nonatomic, strong) UIViewController *resultVC;

@end

@implementation SearchViewController

+ (SearchViewController *)viewControllerWithMainViewController:(UIViewController *)mainVC
                                       SearchResultsController:(UIViewController *)result {
    
    SearchViewController *vc = [[SearchViewController alloc] init];
    vc.mainVC = mainVC;
    vc.resultVC = result;
    return vc;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    
    [self addChildViewController:self.mainVC];
    [self addChildViewController:self.resultVC];
    
    [self.view addSubview:self.searchFieldBackgroundView];
    [self.searchFieldBackgroundView addSubview:self.searchField];
    [self.searchFieldBackgroundView addSubview:self.searchCancelButton];
    
    [self initializeLayout];
    
    [self.view addSubview:self.mainVC.view];
    [self.view addSubview:self.searchMaskView];
    [self.searchMaskView addSubview:self.resultVC.view];
    
    [self.mainVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(ScreenWidth);
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottomMargin);
    }];
    
    [self.searchMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(ScreenWidth);
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottomMargin);
    }];
    
    [self.resultVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(self.searchMaskView);
    }];
    
    @weakify(self);
    [self.searchField.rac_textSignal subscribeNext:^(NSString *x) {
        
        @strongify(self);
        self.resultVC.view.hidden = x.length == 0;
        if ([self.delegate respondsToSelector:@selector(shouldUpdateResultsController:)]) {
            
            [self.delegate shouldUpdateResultsController:x];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initializeLayout {
    
    [self.searchFieldBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(50);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    
    [self.searchField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_top).offset(10);
        make.left.mas_equalTo(self.searchFieldBackgroundView.mas_left).offset(15);
        make.height.mas_equalTo(32);
        make.right.mas_equalTo(self.searchCancelButton.mas_left);
    }];
    
    [self.searchCancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_top);
        make.width.mas_equalTo(0);
        make.bottom.mas_equalTo(self.searchFieldBackgroundView.mas_bottom);
        make.right.mas_equalTo(self.searchFieldBackgroundView.mas_right).offset(-15);
    }];
}

- (void)updateSearchLayoutInSearching {
    
    [self.searchFieldBackgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(45 + statusHeight);
    }];
    
    [self.searchCancelButton mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(51);
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_top).offset(statusHeight);
    }];
    
    [self.searchField mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_top).offset(8 + statusHeight);
        make.right.mas_equalTo(self.searchCancelButton.mas_left).offset(-10);
    }];
}

- (void)updateSearchLayoutInNormal {
    
    [self.searchFieldBackgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(50);
    }];
    
    [self.searchCancelButton mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(0);
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_top);
    }];
    
    [self.searchField mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.searchFieldBackgroundView.mas_top).offset(10);
        make.right.mas_equalTo(self.searchCancelButton.mas_left);
    }];
}

#pragma mark - GETTER
- (UITextField *)searchField {
    
    if (!_searchField) {
        _searchField = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, ScreenWidth - 30, 32)];
        _searchField.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
        _searchField.layer.cornerRadius = 4;
        _searchField.delegate = self;
//        NSAttributedString *attr =
//        [[NSAttributedString alloc] initWithString:BLLocalizedString(@"str_Country or region", nil)
//                                        attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRGB:0xbfbfbf],
//                                                     NSFontAttributeName : [UIFont systemFontOfSize:16]
//                                                     }];
//        [_searchField setAttributedPlaceholder:attr];
        _searchField.leftView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 32)];
        _searchField.leftViewMode = UITextFieldViewModeAlways;
        
        UIButton *right = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 32)];
        [right setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
        _searchField.rightView = right;
        _searchField.rightViewMode = UITextFieldViewModeAlways;
    }
    return _searchField;
}

- (UIView *)searchFieldBackgroundView {
    
    if (!_searchFieldBackgroundView) {
        _searchFieldBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        _searchFieldBackgroundView.backgroundColor = [UIColor colorWithRGB:0xffffff];
    }
    return _searchFieldBackgroundView;
}

- (UIButton *)searchCancelButton {
    
    if (!_searchCancelButton) {
        _searchCancelButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 15 - 51, statusHeight, 51, 45)];
        NSAttributedString *attr =
        [[NSAttributedString alloc] initWithString:@"Cancel"
                                        attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRGB:0xcfab80],
                                                     NSFontAttributeName : [UIFont systemFontOfSize:16]
                                                     }];
        [_searchCancelButton setAttributedTitle:attr forState:UIControlStateNormal];
        [_searchCancelButton addTarget:self action:@selector(searchCancelEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchCancelButton;
}

- (UIView *)searchMaskView {
    
    if (!_searchMaskView) {
        _searchMaskView = [[UIView alloc] init];
        _searchMaskView.hidden = YES;
        _searchMaskView.backgroundColor = [[UIColor colorWithRGB:0x111111] colorWithAlphaComponent:0.2];
    }
    return _searchMaskView;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [self switchToEditingMode:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self searchCancelEvent];
}

- (void)searchCancelEvent {
    
    self.searchField.text = nil;
    [self switchToEditingMode:NO];
    [self.searchField resignFirstResponder];
}

- (void)switchToEditingMode:(BOOL)isSearching {

    [self.navigationController setNavigationBarHidden:isSearching animated:NO];
    if (isSearching) {

        [self updateSearchLayoutInSearching];
    }else {

        [self updateSearchLayoutInNormal];
    }
    self.searchMaskView.hidden = !isSearching;
}

@end
