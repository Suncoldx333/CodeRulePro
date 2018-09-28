//
//  CRTestViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/28.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "CRTestViewController.h"
#import <Masonry/Masonry.h>
#import "UIColor+EasyWay.h"
#import "CustomizeSearchView.h"

#define placeholderAttribute(t) \
({ \
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:t];     \
    NSRange range = NSMakeRange(0, t.length);   \
    NSDictionary *color = @{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x999999]};  \
    NSDictionary *font = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};     \
    [attr addAttributes:color range:range];     \
    [attr addAttributes:font range:range];      \
    (attr); \
})\


static NSString *const kReuseIdentifier = @"CellReuseIdentifier";


@interface CRTestViewController ()<UISearchBarDelegate, UISearchResultsUpdating>

@property (nonatomic,strong) UISearchController *svc;
@property (nonatomic, strong) HERegionSearchResultViewController *resultVC;
@property (nonatomic, strong) RegionListSearchBar *searchBar;
@property (nonatomic,strong) UITextField *exampleField;
@property (nonatomic, strong) RegionListSearchView *searchView;
@property (nonatomic, strong) ContentNode *node;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation CRTestViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.node = [[ContentNode alloc] init];
    self.node.frame = CGRectMake(0, 0, ScreenWidth, 72);
    [self.view addSubnode:self.node];
    
    [self.view addSubview:self.textView];
}

- (UITextView *)textView {
    
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 100)];
        _textView.textContainer.maximumNumberOfLines = 1;
        _textView.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _textView;
}

- (void)customizeSearchBar {
    
    self.svc.searchBar.frame = CGRectMake(0, 0, ScreenWidth, 72);
    self.svc.searchBar.backgroundImage = [[UIImage alloc] init];
    self.svc.searchBar.backgroundColor = [UIColor whiteColor];
    
    for (UIView *view in self.svc.searchBar.subviews) {
        
        for (UIView *subview in view.subviews) {
            
            if ([subview isKindOfClass:[UITextField class]]) {
                
                UITextField *textField = (UITextField *)subview;
                UIView *bgView = textField.subviews.firstObject;
                if ([bgView isKindOfClass:[NSClassFromString(@"_UISearchBarSearchFieldBackgroundView") class]]) {
                    
                    NSLog(@"%f", bgView.frame.origin.x);
                }
                
                textField.leftView = nil;
                textField.placeholder = @"Country or region";
                
                break;
            }
        }
        
    }
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

#pragma mark -
@interface HERegionSearchResultViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HERegionSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kReuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.searchResults.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseIdentifier];
    }
    NSString *name = self.searchResults[indexPath.row];
    cell.textLabel.text = name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end

#pragma mark -

@implementation RegionListSearchBar

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, ScreenWidth, 72);
        self.backgroundImage = [[UIImage alloc] init];
        self.backgroundColor = [UIColor colorWithRGB:0xffffff];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        if (view.subviews.count > 0) {
            
            for (UIView *subView in view.subviews) {
                if ([subView isKindOfClass:[UITextField class]]) {
                    
                    UITextField *textField = (UITextField *)subView;
                    textField.frame = CGRectMake(15, 11, ScreenWidth - 30, 50);
                    
                    UIView *content = [textField.subviews objectAtIndex:1];
                    if ([content isKindOfClass:[NSClassFromString(@"_UITextFieldContentView") class]]) {

                        NSLog(@"%@", content);
//                        bgView.layer.cornerRadius = 20;
                    }
                    
//                    textField.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
                    textField.leftView = nil;
                    [textField setAttributedPlaceholder:placeholderAttribute(@"Country or region")];
                    
                    break;
                }
            }
        }
    }
}

@end

#pragma mark -

@interface RegionListSearchView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;

@end

@implementation RegionListSearchView

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, ScreenWidth, 72);
        self.backgroundColor = [UIColor colorWithRGB:0xffffff];
        [self addSubview:self.textField];
        [self addSubview:self.button];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(11);
            make.left.equalTo(self).offset(15);
            make.bottom.equalTo(self).offset(-11);
            make.right.equalTo(self.button).offset(-15);
        }];
        
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self).offset(11);
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
    }
    return self;
}

#pragma mark -

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    //condition
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(60);
    }];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    
}

#pragma mark -
- (UITextField *)textField {
    
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 11, ScreenWidth - 30, 50)];
        _textField.layer.cornerRadius = 4;
        _textField.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
        _textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 50)];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        [_textField setAttributedPlaceholder:placeholderAttribute(@"Country or region")];
        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)button {
    
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
        [_button setBackgroundColor:[UIColor colorWithRGB:0x111111]];
        [_button setTitle:@"Cancel" forState:UIControlStateNormal];
    }
    return _button;
}

@end
