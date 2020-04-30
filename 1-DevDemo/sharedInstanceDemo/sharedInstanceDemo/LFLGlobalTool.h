//
//  LFLGlobalTool.h
//  sharedInstanceDemo
//
//  Created by DragonLi on 2018/1/20.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFLGlobalTool : NSObject

/**
 * gets singleton object.
 * @return singleton
 */
+ (LFLGlobalTool*)sharedInstance;

/**
 * destroy the Globalsingleton object.
 */
+ (void )destroySharedInstance;


@end
