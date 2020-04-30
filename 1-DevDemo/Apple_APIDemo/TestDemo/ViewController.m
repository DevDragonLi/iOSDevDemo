//
//  ViewController.m
//  TestDemo
//
//  Created by DragonLi on 2018/5/8.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

//  http://fuckingclangwarnings.com

#import "ViewController.h"
#import "LFLTestClass.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)methodName111{
    LFLTestClass *instance = [[LFLTestClass alloc] initWithPort:1024];
    instance.port = @"sdhcjsabhjvdvghjaesdffghk";
    NSLog(@"%@",instance.portTable);
    [instance deBugisAble:YES];
    if (@available(iOS 12.0, *)) {
        [instance iOS12Invocation];
    } else {
        // Fallback on earlier versions
    }
//    [instance perfectMethod];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self methodName111];
    //#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#if (TARGET_OS_SIMULATOR)
    NSLog(@"log");
#endif
    
}

@end
