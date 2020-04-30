//
//  ViewController.m
//  CameraAndPhotoAlbumDemo
//
//  Created by DragonLi on 2018/4/11.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "ViewController.h"
#import "LFLCameraAndPhotoTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LFLCameraAndPhotoTool *tool = [LFLCameraAndPhotoTool shareInstance];
    
    [tool showPhotoInViewController:self photoDataBlock:^(UIImage *image, NSData *gifData, NSString *videoPath) {
        NSLog(@"%@",image);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
