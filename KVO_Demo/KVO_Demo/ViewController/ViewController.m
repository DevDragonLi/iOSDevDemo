//
//  ViewController.m
//  KVO_Demo
//
//  Created by DragonLi on 2018/4/6.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "ViewController.h"
#import "KVOTestClass.h"
@interface ViewController ()

@property (nonatomic,strong,readwrite) KVOTestClass *kvoInstance;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self KVODemo1];
}

- (void)KVODemo1{
    self.kvoInstance.port = @"oldValue";
    [self.kvoInstance addObserver:self forKeyPath:@"port" options:NSKeyValueObservingOptionNew context:nil];
    [self.kvoInstance addObserver:self forKeyPath:@"subInstance.subPort" options:NSKeyValueObservingOptionNew context:nil];
    
//    self.kvoInstance.port = @"newValue";
//    self.kvoInstance.subInstance.subPort = @"sub_NewValue";
//    self.kvoInstance.port = @"newValue_Two";
    
//    数组的观察 需要借助KVC,mutableArrayValueForKey KVC的数组取值方式，要实现KVO必须通过KVC对数据进行操作.
    [self.kvoInstance addObserver:self forKeyPath:@"ports" options:(NSKeyValueObservingOptionNew) context:nil];
    // 正常的操作是不起作用的
    [[self.kvoInstance mutableArrayValueForKey:@"ports"] addObject:@"port:443"];
}

/**
 NSKeyValueObservingOptionNew = 0x01, 返回新值
 NSKeyValueObservingOptionOld = 0x02, 返回旧值
 NSKeyValueObservingOptionInitial  在注册的时候发送一条通知,再改变的时候也会发送通知
 NSKeyValueObservingOptionPrior  改变之前,之后都会发送通知
 
 KVO 和 context : 假设某一个类对象通过,有必要传递一个 唯一的 context以作为标识
 
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    if ([change[NSKeyValueChangeNotificationIsPriorKey] boolValue]) {
//        // Before the change
//    } else {
//        // After the change
//    }
    
//    if (context == &PrivateKVOContext) {
//        // Observe values here
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }    
    NSLog(@"changeInfo:%@",change);
}

#pragma mark ----getters

- (KVOTestClass *)kvoInstance{
    if (_kvoInstance == nil) {
        _kvoInstance = [[KVOTestClass alloc]init];
        _kvoInstance.subInstance =[[KVOTestSubClass alloc]init];
        _kvoInstance.ports =[NSMutableArray array];
    }
    return _kvoInstance;
}
@end
