//
//  ViewController.m
//  sharedInstanceDemo
//
//  Created by DragonLi on 2018/1/20.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"
#import "LFLGlobalTool.h"
#import "LFLViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController==%p",[LFLGlobalTool sharedInstance]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self presentViewController:[LFLViewController new] animated:YES completion:nil];
    });
}


@end
