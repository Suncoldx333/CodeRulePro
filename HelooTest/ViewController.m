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

#import "DevicesIdImports.h"
#import "NSArray+CustomMethod.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import <objc/runtime.h>
#import <Toast.h>


#import "ModelNewChange.h"
#import "ModeChange.h"
#import "UILabel+testCat.h"
#import "LayerLabel.h"

#import <HMSegmentedControl/HMSegmentedControl.h>
#import <lottie-ios/Lottie/Lottie.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "CustomizeProcessView.h"
#import "UIColor+EasyWay.h"

#define createErrorWithDes(m) [NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:m}]
#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

#define GetURLWith(tag) \
({ \
    NSString *inputId = [NSString stringWithFormat:@"input = %ld",(long)tag]; \
    (inputId);\
})\

#define navHeight \
({ \
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame]; \
    CGRect navRect = self.navigationController.navigationBar.frame; \
    CGFloat height = statusRect.size.height + navRect.size.height;  \
    (height);\
})\

#define pickerify(KLASS, PROPERTY) interface \
KLASS (Night) \
@property (nonatomic, copy, setter = dk_set ## PROPERTY ## Picker:) DKColorPicker dk_ ## PROPERTY ## Picker; \
@end \
@interface \
KLASS () \
@property (nonatomic, strong) NSMutableDictionary<NSString *, DKColorPicker> *pickers; \
@end \
@implementation \
KLASS (Night) \
- (DKColorPicker)dk_ ## PROPERTY ## Picker { \
return objc_getAssociatedObject(self, @selector(dk_ ## PROPERTY ## Picker)); \
} \
- (void)dk_set ## PROPERTY ## Picker:(DKColorPicker)picker { \
objc_setAssociatedObject(self, @selector(dk_ ## PROPERTY ## Picker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC); \
[self setValue:picker(self.dk_manager.themeVersion) forKeyPath:@keypath(self, PROPERTY)];\
[self.pickers setValue:[picker copy] forKey:_DKSetterWithPROPERTYerty(@#PROPERTY)]; \
} \
@end

#define __PASTE__(A,B) A##B

typedef void(^testBlock)(NSNumber *);

@interface ViewController ()


@property (nonatomic, strong) LOTAnimationView *lottieView;
@property (nonatomic,strong) ObserverModel *model;
@property (nonatomic,strong) RACSignal *sign1;
@property (nonatomic,strong) RACCommand *command;
@property (nonatomic, strong) Family *sssmodel;
@property (nonatomic, strong) ModelNewChange *testModel;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@property (nonatomic, strong) CAShapeLayer *testLayer;

@end

@implementation ViewController{
    NSInteger i;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
//    self.lottieView = [LOTAnimationView animationNamed:@"LottieLogo1"];
//    self.lottieView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight * 0.3);
//    self.lottieView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:self.lottieView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.view.backgroundColor = [UIColor lightGrayColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
    [self.view addGestureRecognizer:tap];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(100, 0)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(0, 0)];
    
    self.testLayer = [CAShapeLayer layer];
    self.testLayer.fillColor = [UIColor colorWithRGB:0x57A6FF].CGColor;
    self.testLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:self.testLayer];
}

- (void)tapEvent {
    
    
}

#pragma mark -
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

- (NSMutableAttributedString *)signUpAttribute {
    
    NSString *title = @"Sign up";
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    
    NSDictionary *underLine = @{NSUnderlineStyleAttributeName : [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    [attr addAttributes:underLine range:NSMakeRange(0, title.length - 1)];
    
    return attr;
}

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
