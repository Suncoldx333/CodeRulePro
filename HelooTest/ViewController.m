//
//  ViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/21.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ViewController.h"

#import "SubVCsHeader.h"



#import "OriginModel.h"
#import "ObserverModel.h"
#import "ModelIm.h"
#import "ObjectWithProtocol.h"

#import "DevicesIdImports.h"
#import "NSArray+CustomMethod.h"
#import "ModelNewChange.h"
#import "ModeChange.h"
#import "UILabel+testCat.h"
#import "LayerLabel.h"
#import "CustomizeTextField.h"
#import "CustomizeProcessView.h"
#import "UIColor+EasyWay.h"
#import "ReaSubModel1.h"

#import "ThirdCodeHeader.h"
#import "SubVCsHeader.h"
#import "MacroHeader.h"
#import <libPhoneNumber-iOS/NBPhoneNumberUtil.h>

typedef void(^testBlock)(NSNumber *);
static NSTimeInterval const aniTime = 0.2;

@interface ViewController ()<UITextFieldDelegate, CAAnimationDelegate>

@property (nonatomic, strong) LOTAnimationView *lottieView;
@property (nonatomic,strong) ObserverModel *model;
@property (nonatomic,strong) RACSignal *sign1;
@property (nonatomic,strong) RACCommand *command;
@property (nonatomic, strong) Family *sssmodel;
@property (nonatomic, strong) ModelNewChange *testModel;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@property (nonatomic, strong) CAShapeLayer *testLayer;
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *testButton;

@property (nonatomic, strong) NSMutableArray *animatableConstraints;
@property (nonatomic, strong) UIView *leftAnimationView;
@property (nonatomic, strong) ReaSubModel1 *model1;
@property (nonatomic, strong) CAShapeLayer *status;
@property (nonatomic, assign) NSInteger rotationCount;

@end

@implementation ViewController{
    NSInteger i;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rotationCount = 0;
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(45 + kSafeAreaBottomPadding);
    }];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, -50)];
    [path addArcWithCenter:CGPointMake(0, 0)
                    radius:50
                startAngle:-M_PI_2
                  endAngle:M_PI_2 * 3
                 clockwise:YES];
    self.status.path = path.CGPath;
    
    [self.view.layer addSublayer:self.status];
    
    self.header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.header.backgroundColor = [UIColor colorWithRGB:0x111111];
    self.header.alpha = 0;
    [self.view addSubview:self.header];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSMutableString * changedString = [[NSMutableString alloc] initWithString:textField.text];
    [changedString replaceCharactersInRange:range withString:string];
    
    return changedString.length < 10;
}

- (void)tapEvent {
    NBPhoneNumberUtil *phoneUtil = [[NBPhoneNumberUtil alloc] init];
    NSString *nationalNum = @"+86";
    NSString *number1 = [phoneUtil getRegionCodeForCountryCode:@(86)];
    NSError *error = nil;
    NBPhoneNumber *number = [phoneUtil parse:@"1373221254"
                               defaultRegion:@"CN"
                                       error:&error];
    if (error == nil) {
        NSLog(@"isValidPhoneNumber ? [%@]", [phoneUtil isValidNumber:number] ? @"YES":@"NO");
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
}

- (void)stopCusAnimation {
    [self.status removeAnimationForKey:@"C"];
    self.status.contents = (id)[UIImage imageNamed:@"icon_scene_step_success"].CGImage;
    self.status.contentsGravity = kCAGravityResizeAspect;
}

#pragma mark - CAAnimation
- (CAKeyframeAnimation *)colorChangeAni {
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"fillColor"];
    ani.values = @[(id)[UIColor colorWithRGB:0xcfab80].CGColor, (id)[UIColor colorWithRGB:0xffffff].CGColor];
    ani.keyTimes = @[@0.5, @1];
    ani.fillMode = kCAFillModeForwards;
    ani.duration = aniTime;
    ani.removedOnCompletion = NO;
    ani.calculationMode = kCAAnimationPaced;
    return ani;
}

- (CABasicAnimation *)strokeAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [ani setValue:@"myCircleStroken" forKey:@"animationKey"];
    ani.fromValue = @1;
    ani.toValue = @0.75;
    ani.fillMode = kCAFillModeForwards;
    ani.duration = aniTime;
    ani.removedOnCompletion = NO;
    ani.delegate = self;
    return ani;
}

- (CABasicAnimation *)rotationAni {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [ani setValue:@"myCircleRotation" forKey:@"animationKey"];
    ani.fromValue = @(0);
    ani.toValue = @(M_PI * 2);
    ani.fillMode = kCAFillModeForwards;
    ani.duration = aniTime * 5;
    ani.removedOnCompletion = NO;
    ani.repeatCount = HUGE_VALF;
    ani.delegate = self;
    return ani;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([[anim valueForKey:@"animationKey"] isEqualToString:@"myCircleStroken"] && flag) {
        [self.status addAnimation:[self rotationAni] forKey:@"C"];
    }
}

#pragma mark - GETTER
- (HMSegmentedControl *)segmentedControl {
    
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        _segmentedControl.sectionTitles = @[NSLocalizedString(@"str_邮箱", nil), NSLocalizedString(@"str_手机", nil)];
        _segmentedControl.backgroundColor = [UIColor whiteColor];
        _segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
        _segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
        _segmentedControl.selectionIndicatorColor = [UIColor blackColor];
        CGFloat inset = ScreenWidth / 4 - 20;
        _segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, -inset, 0, inset);
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentedControl.selectionIndicatorHeight = 2;
        _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    }
    return _segmentedControl;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setBackgroundColor:[UIColor colorWithRGB:0x999999]];
        NSAttributedString *attr =
        [[NSAttributedString alloc] initWithString:@"确定"
                                        attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x111111],
                                                     NSFontAttributeName : [UIFont systemFontOfSize:15]
                                                     }];
        [_button setAttributedTitle:attr forState:UIControlStateNormal];
        
        NSAttributedString *newAttr =
        [[NSAttributedString alloc] initWithString:@"不确定"
                                        attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRGB:0x111111],
                                                     NSFontAttributeName : [UIFont systemFontOfSize:15]
                                                     }];
        [_button setAttributedTitle:newAttr forState:UIControlStateSelected];
        
        [_button addTarget:self action:@selector(tapEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (CAShapeLayer *)status {
    if (!_status) {
        _status = [CAShapeLayer layer];
        _status.fillColor = [UIColor colorWithRGB:0xcfab80].CGColor;
        _status.lineWidth = 1;
        _status.strokeColor = [UIColor colorWithRGB:0xcfab80].CGColor;
        [_status setPosition:CGPointMake(100, 100)];
    }
    return _status;
}

#pragma mark -
- (CGPoint)getCenter:(UIView *)view {
    
    CGFloat x = view.bounds.size.width / 2;
    CGFloat y = view.bounds.size.height / 2;
    return CGPointMake(x, y);
}

- (void)initData {
    
    self.model = [[ObserverModel alloc] init];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mayIReturn) name:@"BL_Region_Set_Finished" object:nil];

}

- (void)bindViewModel {
    
    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"send request1");
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *signal2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"send request2");
        [subscriber sendNext:@2];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *signal = [RACSignal merge:@[signal1, signal2]];
    [signal subscribeNext:^(id x) {
        
        NSLog(@"merge = %@", x);
    }];
}

- (void)network {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    
    NSString *url = @"http://site.zhaoyunwang/etc/family/data2";
    [manager POST:url
       parameters:nil
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"success");
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"fail");
          }];
}

- (CAShapeLayer *)circleInPoint {
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor colorWithRGB:0xffffff].CGColor;
    layer.strokeColor = [UIColor colorWithRGB:0x57A6FF].CGColor;
    layer.lineWidth = 1;
    [layer setLineJoin:kCALineCapRound];

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 14, 14, 10, -M_PI_2, M_PI * 1.5, 0);
    
    [layer setPath:path];
    CGPathRelease(path);
    
    return layer;
}

- (void)method {
    
    
    
}

- (NSString *)helloBlock {
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    __block NSString *strrr = @"";
    
    [self createNumber:^(NSNumber *num) {

        NSString *numStr = [NSString stringWithFormat:@"%@",num];
        strrr = numStr;
        dispatch_semaphore_signal(sem);
        
    }];
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    return strrr;
}

- (void)createNumber:(testBlock)block {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSNumber *num = [NSNumber numberWithInt:99];
        
        block(num);
    });
}

#pragma mark - Signal
- (RACSignal *)deliverSecondSignal:(NSNumber *)firstNumber {
    
    RACSignal *sig = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:[NSNumber numberWithInt:firstNumber.intValue + 9]];
        return nil;
    }];
    return sig;
}

- (RACSignal *)firstSigTap {
    
    RACSignal *sig = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@19];
        [subscriber sendCompleted];
        return nil;
    }];
    return sig;
}

- (RACSignal *)secondSigTap:(NSNumber *)firstInput {
    
    
    RACSignal *sig = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSString *second = [NSString stringWithFormat:@"will send %@",firstInput];
        [subscriber sendNext:second];
        return nil;
    }];
    return sig;
}


@end
