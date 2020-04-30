//
//  PicTestView.m
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/27.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "PicTestView.h"
#import <FLAnimatedImage/FLAnimatedImageView.h>
#import <FLAnimatedImage/FLAnimatedImage.h>

@implementation PicTestView

- (void)setShowModel:(PicModel *)showModel{
    if (showModel.data) {
        self.image = nil;
      self.animatedImage =  [[FLAnimatedImage alloc]initWithAnimatedGIFData:showModel.data optimalFrameCacheSize:0 predrawingEnabled:YES];
    } else {
        self.animatedImage = nil;
        self.image = showModel.image;
    }
}

@end
