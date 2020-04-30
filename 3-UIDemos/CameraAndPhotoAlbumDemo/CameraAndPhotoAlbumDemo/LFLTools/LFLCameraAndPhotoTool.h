//
//  LFLCameraAndPhotoTool.h
//  CameraAndPhotoAlbumDemo
//
//  Created by DragonLi on 2018/4/12.
//  Copyright © 2018年 DragonLi. All rights reserved.
//              调用系统相机和相册的工具类

#import <UIKit/UIKit.h>

typedef void( ^photoDataBlock )(UIImage *image,NSData *gifData,NSString *videoPath);

@interface LFLCameraAndPhotoTool : NSObject

@property (nonatomic, copy)photoDataBlock photoBackBlock;

+ (instancetype)shareInstance;

+ (instancetype)alloc UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;


- (void)showPhotoInViewController:(UIViewController *)vc
                   photoDataBlock:(photoDataBlock)photoDataBlock;


// 其他雷同上 
    

@end
