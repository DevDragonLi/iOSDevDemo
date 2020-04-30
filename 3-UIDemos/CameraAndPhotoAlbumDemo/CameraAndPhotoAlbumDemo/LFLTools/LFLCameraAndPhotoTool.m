//
//  LFLCameraAndPhotoTool.m
//  CameraAndPhotoAlbumDemo
//
//  Created by DragonLi on 2018/4/12.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "LFLCameraAndPhotoTool.h"
#import <MobileCoreServices/MobileCoreServices.h>

typedef enum : NSUInteger {
    photoType,
    cameraType,
    videoType,
} LFL_pickerType;

static LFLCameraAndPhotoTool *tool ;

@interface LFLCameraAndPhotoTool ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic ,strong)  UIImagePickerController *picker;

@end

@implementation LFLCameraAndPhotoTool


+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [LFLCameraAndPhotoTool new];
    });
    
    return tool;
}

// Example method
- (void)showPhotoInViewController:(UIViewController *)vc
                   photoDataBlock:(photoDataBlock)photoDataBlock{
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self configImagePicker:photoType];
    [vc presentViewController:self.picker animated:YES completion:nil];//进入照相界面
    [vc.view layoutIfNeeded];
}


#pragma mark - imagePicker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, NULL);
            });
        }
        if (self.photoBackBlock) {
            self.photoBackBlock(image, nil, nil);
        }
        [picker dismissViewControllerAnimated:YES completion:nil];
        
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        
        NSURL *url=[info objectForKey:UIImagePickerControllerMediaURL];
        NSString *urlStr=[url path];
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
            UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
    }
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        
    }else{
        if (self.photoBackBlock) {
            self.photoBackBlock(nil, nil, videoPath);
        }
        [self.picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)configImagePicker:(LFL_pickerType )type{
    self.picker = nil;
    self.picker = [[UIImagePickerController alloc] init];//初始化
    UIColor *navColor = [UIColor whiteColor];
    [self.picker.navigationBar setTintColor:navColor];
    [self.picker.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:navColor}];
    self.picker.delegate = self;
    if (type == photoType) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.picker.sourceType = sourceType;
    }else if (type == cameraType || type == videoType){
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        self.picker.sourceType = sourceType;
        if (type == videoType) {
            self.picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
            self.picker.videoQuality=UIImagePickerControllerQualityTypeIFrame1280x720;
            self.picker.cameraCaptureMode=UIImagePickerControllerCameraCaptureModeVideo;
        }
    }
}

@end
