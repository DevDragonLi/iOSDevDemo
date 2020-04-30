//
//  KVOTestClass.h
//  KVO_Demo
//
//  Created by DragonLi on 2018/5/16.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KVOTestSubClass.h"

@interface KVOTestClass : NSObject

@property (nonatomic,strong,readwrite) KVOTestSubClass *subInstance;

@property (nonatomic,copy,readwrite) NSString *port;

@property (nonatomic,strong,readwrite) NSMutableArray *ports;

@end
