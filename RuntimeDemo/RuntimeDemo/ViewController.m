//
//  ViewController.m
//  RuntimeDemo
//
//  Created by DragonLi on 2018/5/21.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "LFLTest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Runtime";
    self.view.backgroundColor =[UIColor whiteColor];
    [self IMPDircDemo];
}

- (void)IMPDircDemo{
    LFLTest *test =[LFLTest new];
//    [test printLog];
    
    void(*function)(id, SEL) = (void(*)(id, SEL))class_getMethodImplementation([LFLTest class], @selector(printLog));
    
    function(test, @selector(printLog));
    
    
}

//



@end
