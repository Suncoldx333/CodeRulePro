//
//  ViewController.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/5/21.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "ViewController.h"
#import "OriginModel.h"
#import "ObserverModel.h"

#import "DevicesIdImports.h"
#import "NSArray+CustomMethod.h"

#import <ReactiveObjC.h>
#import "firstSubVC.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic,strong) ObserverModel *model;
@property (nonatomic,strong) RACSignal *sign1;
@property (nonatomic,strong) RACCommand *command;

@end

@implementation ViewController{
    NSInteger i;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
    [self bindViewModel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.view.backgroundColor = [UIColor lightGrayColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
    [self.view addGestureRecognizer:tap];
}

- (void)initData {
    
    self.model = [[ObserverModel alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mayIReturn) name:@"BL_Region_Set_Finished" object:nil];

}

- (void)bindViewModel {
    
    RACSignal *sig1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendError:[NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:@"nooooo"}]];
//        [subscriber sendNext:@1];
//        [subscriber sendCompleted];
        return nil;
    }];

    RACSignal *sig2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@3];
        return nil;
    }];
    
    RACSignal *concat = [sig1 concat:sig2];
    [concat subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    } error:^(NSError * _Nullable error) {
        NSLog(@"mes = %@",error.localizedDescription);
    }];

}

- (void)tapEvent {
    
    [[[[self makeFirstSignal]
       doNext:^(id  _Nullable x) {
           NSLog(@"first = %@",x);
       }] flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
           NSNumber *deliver = [value isKindOfClass:[NSNumber class]] ? (NSNumber *)value : [NSNumber numberWithInt:0];
           return [[self deliverSecondSignal:deliver] map:^id _Nullable(id  _Nullable value) {
               return @"blalala";
           }];
       }] subscribeNext:^(id  _Nullable x) {
           NSLog(@"x = %@",x);
       } error:^(NSError * _Nullable error) {
           NSLog(@"mes = %@",error.localizedDescription);
       }];
    
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (int i = 1; i < 13; i++) {
        [list addObject:[NSString stringWithFormat:@"%02d",i]];
    }
    NSLog(@"%@",list);
    
}

- (void)mayIReturn {
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:0.8]];
    
//    [self.navigationController popViewControllerAnimated:YES];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"BL_Region_Set_Finished" object:nil];
}

- (RACSignal *)makeFirstSignal {
    
    RACSignal *sig = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendError:[NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:@"here is first error"}]];
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return nil;
    }];
    return sig;
}

- (RACSignal *)deliverSecondSignal:(NSNumber *)firstNumber {
    
    RACSignal *sig = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendError:[NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:@"here is second error"}]];
        return nil;
    }];
    return sig;
    
}

@end
