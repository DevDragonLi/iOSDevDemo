//
//  LFLGlobalTool.m
//  sharedInstanceDemo
//
//  Created by DragonLi on 2018/1/20.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "LFLGlobalTool.h"

@implementation LFLGlobalTool

static LFLGlobalTool *SINGLETON = nil;

static dispatch_once_t onceToken;  //

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (instancetype)sharedInstance
{
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (instancetype) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (instancetype)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (instancetype)copy
{
    return [[LFLGlobalTool alloc] init];
}

- (id)mutableCopy
{
    return [[LFLGlobalTool alloc] init];
}

- (instancetype)init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}

+ (void)destroySharedInstance{
    onceToken = 0;
    SINGLETON = nil;
    NSLog(@"destroySharedInstance==%p",SINGLETON);
}

@end
