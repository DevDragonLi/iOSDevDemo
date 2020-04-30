//
//  ViewController.m
//  test-demo
//
//  Created by DragonLi on 2018/3/12.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"

#import <JueJinBasedComponent/JueJinBasedComponent.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // example :Block  handle Click
    
    [self.testLabel click_XTHandleBlock:^{
        NSLog(@"testLabel-Click");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
