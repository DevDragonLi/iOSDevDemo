//
//  ViewController.m
//  RunLoopDemo
//
//  Created by DragonLi on 2018/7/4.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"
#import <pthread/pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self methodName];
}


- (void)methodName{
    
    NSRunLoop *loop =[NSRunLoop currentRunLoop];
    
    CFRunLoopRef refloop = CFRunLoopGetCurrent(); // CFRunLoopGetMain()
    NSLog(@"%@=====%@",loop,refloop);
    
    
    
//    [NSThread currentThread];
    // pthread_main_np()  返回 int
    
    
    
    
}






@end
