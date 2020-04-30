//
//  LFLHandlePicTool.m
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/29.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "LFLHandlePicTool.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <UIKit/UIImagePickerController.h>

@implementation LFLHandlePicTool

+ (void)HandlingImageByInfo:(NSDictionary *)info imageModelSuccessBlock:(void (^)(PicModel *))imageModelSuccessBlock imageModelFailureBlock:(void (^)(PicModel *))imageModelFailureBlock{
    NSURL *originSourceURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    
    // handle GIF
    if([originSourceURL.absoluteString hasSuffix:@"GIF"]){
        ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc]init];
        [assetLibrary assetForURL:[info objectForKey:UIImagePickerControllerReferenceURL] resultBlock:^(ALAsset *asset) {
            ALAssetRepresentation *re = [asset representationForUTI:(__bridge NSString *)kUTTypeGIF];;
            NSUInteger size = (NSUInteger)re.size;
            uint8_t *buffer = malloc(size);
            NSError *error;
            NSUInteger bytes = [re getBytes:buffer fromOffset:0 length:size error:&error];
            NSData *data = [NSData dataWithBytes:buffer length:bytes];
            if (imageModelSuccessBlock) imageModelSuccessBlock( [PicModel picWithData:data image:nil]);
            free(buffer);
        } failureBlock:^(NSError *error) {
            if (imageModelFailureBlock) imageModelFailureBlock( [PicModel picWithData:nil image:nil]);
        }];
        
    } else {
        if (imageModelSuccessBlock) imageModelSuccessBlock( [PicModel picWithData:nil image:info[UIImagePickerControllerOriginalImage]]);
    }
}








@end
