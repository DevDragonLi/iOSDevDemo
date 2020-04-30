//
//  LFLCameraTool.m
//  CameraAndPhotoAlbumDemo
//
//  Created by DragonLi on 2018/4/11.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "LFLCameraTool.h"
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface LFLCameraTool ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@end

@implementation LFLCameraTool

- (void)configurationImagePickerWithVC:(UIViewController *)VC{
    UIImagePickerController *pickVC = [[UIImagePickerController alloc]init];
    pickVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        // video 参考注释代码
    NSString *requreMediaType = (__bridge NSString *)kUTTypeImage; // (__bridge NSString *)kUTTypeMovie
    pickVC.mediaTypes = @[requreMediaType];
    pickVC.allowsEditing = YES;
    pickVC.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
    pickVC.delegate = self;
    //    拍摄视频质量 和时间
//    pickVC.videoQuality = UIImagePickerControllerQualityTypeHigh;
//    pickVC.videoMaximumDuration = 30;
    [VC.navigationController presentViewController:pickVC animated:YES completion:nil];
}

#pragma mark ImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)editingInfo{
    //editingInfo  所有信息
    NSDictionary *dict = editingInfo[UIImagePickerControllerMediaMetadata];
    NSLog(@"拍照的图片信息%@",dict);
    //    媒体附加信息
    NSString *mediaType = [editingInfo objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeImage]) {
//    takephoto  =>   UIImage *image = [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
    }
    //   3. 图片保存
//    SEL saveImage = @selector(image :didFinishSavingWithError:contextInfo:);
//    UIImageWriteToSavedPhotosAlbum(nil, self, saveImage, nil);
    
    // video
    if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeMovie]) {
        NSDictionary *movieInfo = [editingInfo objectForKey:UIImagePickerControllerMediaMetadata];
        //        拿到URl
        NSURL *urlVideo = [movieInfo objectForKey:UIImagePickerControllerMediaURL];
        [self saveMediaUrl:urlVideo];
    }
    
    [self imagePickerControllerDidCancel:picker];
}

///保存视频
- (void)saveMediaUrl:(NSURL *)url{
//    ALAssetsLibrary *asLib = [ALAssetsLibrary new];
//    [asLib writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
//        if (error) {
//            NSLog(@"保存失败");
//        }
//    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 1.常见属性检测

- (void)propertyJuge{
    //1. 检测当前相机可用枚举     isSourceTypeAvailable 后面枚举类型决定检测内容
    BOOL isSourceTypeAvailable =  [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    NSLog(@"检测当前相机是否可用%d",isSourceTypeAvailable);
    
    //2.检测相机闪光灯是否可用
    BOOL isFlashAvailableForCameraDevice =  [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
    BOOL isFlashAvailableForDeviceRear =  [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
    NSLog(@"检测前闪光灯是否可用%d",isFlashAvailableForCameraDevice);
    NSLog(@"检测后闪光灯是否可用%d",isFlashAvailableForDeviceRear);
    
    //3.检测前后相机是否可用
    BOOL isAvailableForCameraDevice =  [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    BOOL isAvailableForDeviceRear =  [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    
    NSLog(@"检测前是否可用%d",isAvailableForCameraDevice);
    NSLog(@"检测后是否可用%d",isAvailableForDeviceRear);
    
    //4.  支持类型  image ,video kUTTypeImage 需要桥接转换
    
    if ([self supportMedia:(__bridge NSString *)kUTTypeImage]) {
        NSLog(@"支持拍照");
    }else if ([self supportMedia:(__bridge NSString *)kUTTypeVideo]){
        NSLog(@"支持录像");
    }
    
}

/**
 *  @param medaType 传入媒体的类型
 */
- (BOOL)supportMedia:(NSString *)medaType{
    //    同样,后面枚举决定检测内容
    NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    NSLog(@"%@",availableMedia); // 模拟器下是null
    for (NSString *string in availableMedia) {
        if ([string isEqualToString:medaType]) {
            NSLog(@"支持的类型");
        }else{
            NSLog(@"不支持");
        }
    }
    return 0;
}

@end
