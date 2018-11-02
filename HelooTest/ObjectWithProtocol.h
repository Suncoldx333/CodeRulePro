//
//  ObjectWithProtocol.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/10/18.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BLSceneDeviceProtocol <NSObject>

@property (nonatomic, copy) NSString *sceneId;
@property (nonatomic, copy) NSString *did;
@property (nonatomic, copy) NSString *gatewayId;
@property (nonatomic, copy) NSNumber *sceneDevOrder;
@property (nonatomic, copy) NSString *roomId;
@property (nonatomic, copy) NSDictionary *content;

@end

@interface ObjectWithProtocol : NSObject <BLSceneDeviceProtocol>

@property (nonatomic, copy) NSString *proOutPro;

@end

@interface ObjectWithOriProtocol : NSObject <BLSceneDeviceProtocol>

@end
