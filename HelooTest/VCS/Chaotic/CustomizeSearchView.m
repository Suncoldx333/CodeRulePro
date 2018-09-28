 //
//  CustomizeSearchView.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/7.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "CustomizeSearchView.h"
#import "UIColor+EasyWay.h"

#define placeholderAttribute(t) \
({ \
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:t];     \
    NSRange range = NSMakeRange(0, t.length);   \
    NSDictionary *color = @{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x999999]};  \
    NSDictionary *font = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};     \
    [attr addAttributes:color range:range];     \
    [attr addAttributes:font range:range];      \
    (attr); \
})\

@implementation CustomizeSearchView

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, 375, 72);
        ContentNode *node = [[ContentNode alloc] init];
        node.frame = self.bounds;
        [self addSubnode:node];
        
    }
    return self;
}

@end

#pragma mark -
@interface ContentNode ()<ASEditableTextNodeDelegate> {
    
    ASDisplayNode *node1;
    ASDisplayNode *node2;
    NSMutableArray *nodes;
}

@property (nonatomic, strong) ASEditableTextNode *textField;
@property (nonatomic, strong) ASButtonNode *button;

@end

@implementation ContentNode

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.automaticallyManagesSubnodes = YES;
        self.defaultLayoutTransitionDuration = 1.0;
        
        nodes = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor colorWithRGB:0xffffff];
        
        self.textField = [[ASEditableTextNode alloc] init];
        self.textField.backgroundColor = [UIColor colorWithRGB:0xf5f5f5];
        self.textField.attributedPlaceholderText = placeholderAttribute(@"Country or region");
        self.textField.textContainerInset = UIEdgeInsetsMake(15, 14, 14, 0);
        self.textField.delegate = self;
        self.textField.typingAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName : [UIColor colorWithRGB:0x999999]};
        
        self.button = [[ASButtonNode alloc] init];
        [self.button setTitle:@"Cancel"
                     withFont:[UIFont systemFontOfSize:15]
                    withColor:[UIColor colorWithRGB:0xffffff]
                     forState:UIControlStateNormal];
        self.button.backgroundColor = [UIColor colorWithRGB:0x111111];
        [self.button addTarget:self action:@selector(cancelEvent) forControlEvents:ASControlNodeEventTouchUpInside];
        self.button.cornerRadius = 10;
        
        [nodes addObject:self.textField];
    }
    return self;
}

- (void)editableTextNodeDidBeginEditing:(ASEditableTextNode *)editableTextNode {
    
    [nodes removeAllObjects];
    [nodes addObject:self.textField];
    [nodes addObject:self.button];
    self.textField.style.spacingAfter = 10;
    
//    [self transitionLayoutWithAnimation:NO shouldMeasureAsync:NO measurementCompletion:nil];
    [self setNeedsLayout];
}

- (void)editableTextNodeDidFinishEditing:(ASEditableTextNode *)editableTextNode {
    
    [nodes removeAllObjects];
    [nodes addObject:self.textField];
    self.textField.style.spacingAfter = 0;

//    [self transitionLayoutWithAnimation:NO shouldMeasureAsync:NO measurementCompletion:nil];
    [self setNeedsLayout];
}

- (void)cancelEvent {
    
    [self.textField resignFirstResponder];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    self.textField.style.flexGrow = 1;
    self.textField.style.minHeight = ASDimensionMake(50);

    self.button.style.preferredSize = CGSizeMake(60, 50);
    ASStackLayoutSpec *hori = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                      spacing:0
                                                               justifyContent:ASStackLayoutJustifyContentCenter
                                                                   alignItems:ASStackLayoutAlignItemsCenter
                                                                     children:nodes];
    
    ASInsetLayoutSpec *inset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(11, 15, 11, 15) child:hori];
    return inset;
}

@end
