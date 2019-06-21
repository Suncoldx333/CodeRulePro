//
//  RadarViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2019/3/8.
//  Copyright © 2019年 ZhaoyunWang. All rights reserved.
//

#import "RadarViewController.h"
#import "UIColor+EasyWay.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>
#import "MecsoViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import "UIImage+Cut.h"
#import "UIDevice+Mach.h"

#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "ParentObject.h"

static CGFloat const kCorpusRadius = 27;

@interface RadarViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UIProgressView *processView;
@property (nonatomic, strong) UILabel *processLabel;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation RadarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGB:0xffffff];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 72, 72)];
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor colorWithRGB:0x007ffb].CGColor;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.userInteractionEnabled = NO;
    indicator.center = CGPointMake(button.bounds.size.width / 2, button.bounds.size.height / 2);
    [button addSubview:indicator];
    [indicator startAnimating];
    
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_icon_back_black"]
//                                                                 style:UIBarButtonItemStylePlain
//                                                                target:self
//                                                                action:@selector(cancenlEvent:)];
//    leftItem.tintColor = [UIColor colorWithRGB:0x666666];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//
    self.title = @"Radar";
    
//    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    NSString *htmlFilePath = [[NSBundle mainBundle] pathForResource:@"getData" ofType:@"html"];
//    NSURL *url = [NSURL fileURLWithPath:htmlFilePath];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
}

- (void)cancenlEvent:(UIBarButtonItem *)sender {
}

- (void)testMerge {
    RACSignal *sig1 = [[[self createTestSignal:YES] doNext:^(id x) {
        NSLog(@"next1");
    }] doError:^(NSError *error) {
        NSLog(@"error1");
    }];
    RACSignal *sig2 = [[[self createTestSignal:NO] doNext:^(id x) {
        NSLog(@"next2");
    }] doError:^(NSError *error) {
        NSLog(@"error2");
    }];
    RACSignal *sig3 = [[[self createTestSignal:NO] doNext:^(id x) {
        NSLog(@"next3");
    }] doError:^(NSError *error) {
        NSLog(@"error3");
    }];
    RACSignal *merge = [[[RACSignal merge:@[sig1, sig2, sig3]] doCompleted:^{
        NSLog(@"do complete");
    }] doError:^(NSError *error) {
        NSLog(@"do error");
    }];
    RACSignal *combine = [[[RACSignal combineLatest:@[sig1, sig2, sig3]] doCompleted:^{
        NSLog(@"do complete");
    }] doError:^(NSError *error) {
        NSLog(@"do error");
    }];
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return combine;
    }];
    [[command.executionSignals switchToLatest] subscribeNext:^(id x) {
        NSLog(@"sub next");
    }
                                                       error:^(NSError *error) {
                                                           NSLog(@"sub error");
                                                       }
                                                   completed:^{
                                                       NSLog(@"sub complete");
                                                   }];
    [command execute:nil];

}

- (RACSignal *)createTestSignal:(BOOL)test {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if (test) {
            [subscriber sendNext:@"success"];
            [subscriber sendCompleted];
        } else {
            [subscriber sendError:[NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:@"nooooo"}]];
        }
        return nil;
    }];
}

- (void)buttonEvent {
    NSLog(@"123131");
}


- (void)timeCount {
    if (self.count > 90) {
        [self.timer invalidate];
        self.timer = nil;
        return;
    }
    self.count = self.count + 10;
    self.processLabel.text = [NSString stringWithFormat:@"%ld", (long)self.count];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"string = %@", string);
    return YES;
}

- (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"length = %lu", (unsigned long)textView.text.length);
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"length = %lu", (unsigned long)textView.text.length);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MecsoViewController *vc = [[MecsoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)h5PrivateData:(NSDictionary *)dic {
    NSLog(@"other");
    BOOL success = NO;
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return;
    }
    NSString *action = [dic objectForKey:@"action"];
    NSString *fileName = [dic objectForKey:@"fileName"];
    NSString *fileData = [dic objectForKey:@"fileData"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [NSString stringWithFormat:@"%@/%@",documentsDirectory,fileName];
    
    if ([action isEqualToString:@"r"]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            NSData *localData = [NSData dataWithContentsOfFile:path];
            NSString *content = [[NSString alloc] initWithData:localData encoding:NSUTF8StringEncoding];
            success = YES;
            fileData = content;
        } else {
            success = NO;
            fileData = @"";
        }
    } else if ([action isEqualToString:@"w"]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            NSError *error;
            success = [fileData writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
            fileData = @"";
        } else {
            BOOL create = [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
            if (create) {
                NSError *error;
                success = [fileData writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
                fileData = @"";
            } else {
                success = NO;
                fileData = @"";
            }
        }
    }
}

- (void)uploadImage {
    NSString *code = @"1212386";
    NSString *final = [NSString stringWithFormat:@"%.4d", code.intValue];
    NSLog(@"%@", final);
}



- (UIProgressView *)processView {
    if (!_processView) {
        _processView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _processView.frame = CGRectMake(0, 100, 100, 10);
        _processView.trackTintColor = [UIColor colorWithRGB:0xf5f5f5];
        _processView.progressTintColor = [UIColor colorWithRGB:0xcfab80];
        for (UIImageView *imageView in _processView.subviews) {
            imageView.layer.cornerRadius = 5;
            imageView.clipsToBounds = YES;
        }
    }
    return _processView;
}

- (UILabel *)processLabel {
    if (!_processLabel) {
        _processLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 100, 30)];
        _processLabel.textColor = [UIColor colorWithRGB:0x111111];
        _processLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _processLabel;
}

- (CAShapeLayer *)triangle {
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.fillColor = [UIColor colorWithRGB:0xcfab80].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 0)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(50, 0)];
    shape.path = path.CGPath;
    
    shape.position = CGPointMake(100, 100);
    shape.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);

    return shape;
}

- (CAShapeLayer *)corpusLayer:(BOOL)upper {
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.fillColor = [UIColor colorWithRGB:0xcfab80].CGColor;
    CGFloat width = ScreenWidth - 55;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(width - kCorpusRadius, 0)];
    [path addArcWithCenter:CGPointMake(width - kCorpusRadius, kCorpusRadius) radius:kCorpusRadius startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(kCorpusRadius, kCorpusRadius * 2)];
    [path addArcWithCenter:CGPointMake(kCorpusRadius, kCorpusRadius) radius:kCorpusRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(0, 0)];
    shape.path = path.CGPath;
    if (!upper) {
        shape.position = CGPointMake(width, kCorpusRadius * 2);
        shape.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    }
    
    return shape;
}

- (void)gradlineViewOne {
    CAGradientLayer *gradlineLayer = [CAGradientLayer layer];
    gradlineLayer.colors = @[(__bridge id)[UIColor colorWithRGB:0xcfab80].CGColor, (__bridge id)[[UIColor colorWithRGB:0xcfab80] colorWithAlphaComponent:0.5].CGColor];
    gradlineLayer.locations = @[@0.1, @1.0];
    gradlineLayer.startPoint = CGPointMake(1.0, 0.0);
    gradlineLayer.endPoint = CGPointMake(1.0, 1.0);
    gradlineLayer.frame = CGRectMake(20, 20, 100, 100);
    [self.view.layer addSublayer:gradlineLayer];
    
    CAGradientLayer *gradlineLayer1 = [CAGradientLayer layer];
    gradlineLayer1.colors = @[(__bridge id)[[UIColor colorWithRGB:0xcfab80] colorWithAlphaComponent:0.75].CGColor, (__bridge id)[[UIColor colorWithRGB:0xcfab80] colorWithAlphaComponent:0.5].CGColor];
    gradlineLayer1.locations = @[@0.1, @1.0];
    gradlineLayer1.startPoint = CGPointMake(1.0, 0.0);
    gradlineLayer1.endPoint = CGPointMake(1.0, 1.0);
    gradlineLayer1.frame = CGRectMake(20, 120, 100, 100);
    [self.view.layer addSublayer:gradlineLayer1];
}

- (CAShapeLayer *)customizeShapeLayerWithColor:(UIColor *)color
                                     lineWidth:(CGFloat)lineWidth
                                        radius:(CGFloat)radius
                                     fromAngle:(CGFloat)angle1
                                       toAngle:(CGFloat)angle2
                                     clockwise:(BOOL)clockwise {
    
    CAShapeLayer *line = [CAShapeLayer layer];
    [line setFillColor:[UIColor clearColor].CGColor];
    [line setStrokeColor:color.CGColor];
    [line setLineWidth:lineWidth];
    [line setLineJoin:kCALineCapRound];
    
    CGMutablePathRef path = CGPathCreateMutable();
    int clockwiseInt = clockwise ? 0 : 1;
    CGPathAddArc(path, NULL, 0, 0, radius, angle1, angle2, clockwiseInt);
    
    [line setPath:path];
    CGPathRelease(path);
    return line;
}

@end
