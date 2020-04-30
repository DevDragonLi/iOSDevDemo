//
//  PicModel.h
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/27.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface PicModel : NSObject



+ (instancetype)picWithData:(NSData *)data image:(UIImage *)image;

@property (nonatomic,strong) NSData *data; // 显示 GIF

@property (nonatomic,strong)  UIImage *image; // 显示 非图片

@end
