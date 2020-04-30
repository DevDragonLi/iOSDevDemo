//
//  KVOTestClass.m
//  KVO_Demo
//
//  Created by DragonLi on 2018/5/16.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "KVOTestClass.h"

@implementation KVOTestClass


//NSKeyValueObservingCustomization 的 category
/**
 控制 KVO  对应key  开关
 
 @param key key description
 @return bool
 */
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"port"]) {
        return NO;
    } else {
        return NO;
    }
}


/**
 NSKeyValueObserverNotification 的 category

 手动调用 KVO  :
 1. 则要实现 automaticallyNotifiesObserversForKey 方法，return NO。
 2. 手动处理以下过程
         willChangeValueForKey
         _port = port
         didChangeValueForKey
 3. KVO机制的运行是采取同步，单线程的方式 2中需要在同一线程队列处理
 */
- (void)setPort:(NSString *)port{
    [self willChangeValueForKey:@"port"];
    _port = port;
    [self didChangeValueForKey:@"port"];
}

//KVO 依赖键
/*有时候一个属性的值依赖于其他属性值，那么如果其他属性值发生变更，那么必然也就导致该属性值的变更，也即 Dependent Poroperties。在KVO中，引入了依赖键
 example : 当前观察类的附属 subInstance.subPort 改变,当前类需要改变 port
 
 */
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    NSSet *sets = [super keyPathsForValuesAffectingValueForKey:key];
    NSString *keydep = @"subInstance";
    if ([key isEqualToString:keydep]) { // subInstance
        //依赖键的处理
        NSSet *affectingKeys = [NSSet setWithObjects:@"_subInstance.port",nil];
        sets = [sets setByAddingObjectsFromSet:affectingKeys];
    }
    return sets;
}










@end
