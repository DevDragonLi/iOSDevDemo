//
//  LFLViewController.m
//  sharedInstanceDemo
//
//  Created by DragonLi on 2018/1/21.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "LFLViewController.h"
#import "LFLGlobalTool.h"
@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    //  LFLVC delloc -> destroySharedInstance.
    
    NSLog(@"LFLViewController==%p",[LFLGlobalTool sharedInstance]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)dealloc{
    [LFLGlobalTool destroySharedInstance];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
