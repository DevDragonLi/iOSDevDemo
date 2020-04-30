//
//  ViewController.m
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/27.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"

// get

#import "LFLHandlePicTool.h"

 // handle show ... loading ...

#import <SDWebImage/UIImage+GIF.h>
#import <FLAnimatedImage/FLAnimatedImageView.h>
#import <FLAnimatedImage/FLAnimatedImage.h>
#import "PicTestView.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,strong) PicTestView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"点击空白处选取照片";
    PicTestView *imageView =[[PicTestView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    imageView.backgroundColor =[UIColor grayColor];
    [self.view addSubview:imageView];
    self.imageView = imageView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = (id)self;
    [self presentViewController:ipc animated:YES completion:nil];
}

#pragma mark =========================methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    @autoreleasepool {
        __weak typeof(self) ws=self;
        [LFLHandlePicTool HandlingImageByInfo:info imageModelSuccessBlock:^(PicModel *modelInfo) {
            __strong typeof(self) strongSelf=ws;
            strongSelf.imageView.showModel = modelInfo;
        } imageModelFailureBlock:^(PicModel *modelInfo) {
            __strong typeof(self) strongSelf=ws;
            strongSelf.imageView.showModel = modelInfo;
        }];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
