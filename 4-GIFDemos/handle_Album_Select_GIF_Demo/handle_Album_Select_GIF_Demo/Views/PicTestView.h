//
//  PicTestView.h
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/27.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FLAnimatedImage/FLAnimatedImageView.h>

#import "PicModel.h"

@interface PicTestView : FLAnimatedImageView

@property (nonatomic,strong) PicModel *showModel; // 显示 内容模型

@end
