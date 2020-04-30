//
//  PicModel.m
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/27.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "PicModel.h"

@implementation PicModel

+ (instancetype)picWithData:(NSData *)data image:(UIImage *)image{
    PicModel *model =[[PicModel alloc]init];
    model.data = data;
    model.image = image;
    return model;
}

@end
