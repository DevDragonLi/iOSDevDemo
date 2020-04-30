//
//  LFLTestClass.h
//  TestDemo
//
//  Created by DragonLi on 2018/5/8.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFLTestClass : NSObject

@property (nonatomic, copy) NSString *port;

@property (nonatomic, readonly,strong) NSDictionary<NSString *, id>  *portTable;

#pragma mark ---- init

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithPort:(NSInteger)port NS_DESIGNATED_INITIALIZER;


- (void)iOS12Invocation API_AVAILABLE(macos(10.6), ios(12.0), watchos(2.0), tvos(9.0));

- (void)perfectMethod API_DEPRECATED("This method is unsafe because it could potentially cause crash", macos(10.0,10.10), ios(2.0,8.0), watchos(2.0,2.0), tvos(9.0,9.0));

- (void)deBugEnable API_DEPRECATED_WITH_REPLACEMENT("deBugisAble:", macos(10.0,10.13), ios(2.0,11.0), watchos(2.0,4.0), tvos(9.0,11.0));

- (void)deBugisAble:(BOOL)Able;

@end

NS_ASSUME_NONNULL_END
