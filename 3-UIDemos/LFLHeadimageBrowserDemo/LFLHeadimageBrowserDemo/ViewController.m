//
//  ViewController.m
//  LFLHeadimageBrowserDemo
//
//  Created by DragonLi on 2017/8/14.
//  Copyright © 2017年 im.juejin. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+LFLHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self headimageBrowserDemo];
}


- (void)headimageBrowserDemo{
    [self.avatarImageView LFLHeadimageBrowser];
}


@end
