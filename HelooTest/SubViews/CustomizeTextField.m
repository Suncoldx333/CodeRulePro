//
//  CustomizeTextField.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/11/16.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "CustomizeTextField.h"

@interface CustomizeTextField ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *right;

@end

@implementation CustomizeTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 45)];
        self.leftView = left;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
        
        self.right = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        [self.right setImage:[UIImage imageNamed:@"icon_edit_del"] forState:UIControlStateNormal];
        [self.right setImage:[[UIImage alloc] init] forState:UIControlStateDisabled];
        self.rightView = self.right;
        self.rightViewMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSMutableString * changedString = [[NSMutableString alloc] initWithString:textField.text];
    [changedString replaceCharactersInRange:range withString:string];
    NSLog(@"length = %@", changedString);
    self.right.enabled = changedString.length > 0;
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    self.right.enabled = textField.text.length > 0;
}

@end
