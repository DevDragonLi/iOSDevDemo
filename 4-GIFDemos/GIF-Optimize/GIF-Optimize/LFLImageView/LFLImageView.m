//
//  LFLImageView.m
//  Xitu
//  Created by DragonLi on 2017/11/09.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "LFLImageView.h"
#import <SDWebImageManager.h>
#import <NSData+ImageContentType.h>
#import <UIImage+GIF.h>
#import <ImageIO/ImageIO.h>

@implementation LFLImageView {
    
    NSInteger _currentIndex;
    NSTimer *_timer;
    NSData *_data;
}

- (void)LFL_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder progress:(progressBlock)progress completed:(SDWebImageCompletionBlock )completedBlock{
    if (placeholder)    self.image = placeholder;
    _timer = [NSTimer timerWithTimeInterval:0.12 target:self selector:@selector(updateIMG_progress:) userInfo:nil repeats:YES];
    [self downloadIMGData:url progress:progress completed:completedBlock];
}

- (void)updateIMG_progress:(progressBlock)progress{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.image = [self LFL_animatedGIFWithData:_data ];
    });
}

- (void)downloadIMGData:(NSURL *)url progress:(progressBlock)progress completed:(SDWebImageCompletionBlock )completedBlock{
    [[SDWebImageManager sharedManager].imageDownloader downloadImageWithURL:url options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (receivedSize > 0 && expectedSize > 0) {
            float receivedSizeF = receivedSize;
            float expectedSizeF = expectedSize;
            if (progress)     progress(receivedSizeF / expectedSizeF);
        }
        
    }  completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        if (error)    return;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completedBlock) completedBlock(image,error,SDImageCacheTypeNone,url);
        });
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if ([[NSData sd_contentTypeForImageData:data] isEqualToString:@"image/gif"]) {
                _data = data;
                [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image = image;
                });
            }
        }];
    }];
}

- (UIImage *)LFL_animatedGIFWithData:(NSData *)data{
    if (!data) {
        return nil;
    }
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(source);
    UIImage *animatedImage;
    if (count <= 1) {
        animatedImage = [[UIImage alloc] initWithData:data];
    }
    else {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, _currentIndex % count, NULL);
        _currentIndex ++;
        animatedImage = [UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        CGImageRelease(image);
    }
    CFRelease(source);
    return animatedImage;
}

@end
