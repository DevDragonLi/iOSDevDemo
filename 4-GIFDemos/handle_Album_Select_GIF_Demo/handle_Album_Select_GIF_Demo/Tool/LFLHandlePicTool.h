//
//  LFLHandlePicTool.h
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/29.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PicModel.h"  
//@class  PicModel;

@interface LFLHandlePicTool : NSObject

/**
 处理相册选取图片资源的工具类,后期可扩展,兼容 video ...

 @param info info description
 @param imageModelSuccessBlock imageModelSuccessBlock description
 @param imageModelFailureBlock imageModelFailureBlock description
 */
+ (void)HandlingImageByInfo:(NSDictionary *)info
     imageModelSuccessBlock:(void (^)(PicModel *modelInfo))imageModelSuccessBlock
     imageModelFailureBlock:(void (^)(PicModel *modelInfo))imageModelFailureBlock;

@end
