//
//  TimePickerViewModel.m
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/9/26.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import "TimePickerViewModel.h"

@interface TimePickerViewModel ()

@property (nonatomic, strong, readwrite) RACCommand *deleteCommand;
@property (nonatomic, strong, readwrite) RACCommand *saveCommand;

@end

@implementation TimePickerViewModel

@synthesize hour;
@synthesize minute;
@synthesize chosenDays;
@synthesize actionId;
@synthesize actionName;

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.hour = @8;
        self.minute = @0;
        self.chosenDays = @"0";
    }
    return self;
}

- (instancetype)initWith:(id<TimingContentProtocol>)content {
    
    if (self = [super init]) {
        
        self.hour = content.hour ?: @8;
        self.minute = content.minute ?: @0;
        self.chosenDays = content.chosenDays ?: @"1001";
        self.actionId = content.actionId;
        self.actionName = content.actionName;
    }
    return self;
}

- (RACCommand *)deleteCommand {
    
    if (!_deleteCommand) {
        _deleteCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            RACSignal *sig = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                [subscriber sendError:[NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:@"Mock Error"}]];
                return nil;
            }];
            return sig;
        }];
    }
    return _deleteCommand;
}

- (RACCommand *)saveCommand {
    
    //MARK: 需传递 定时Id
    if (!_saveCommand) {
        _saveCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            RACSignal *sig = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
//                [subscriber sendError:[NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:@"Mock Error"}]];
                [subscriber sendNext:@"1231"];
                [subscriber sendCompleted];
                return nil;
            }];
            return sig;
        }];
    }
    return _saveCommand;
}

@end
