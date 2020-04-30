//
//  LFLImageView.h
//  Xitu
//  Created by DragonLi on 2017/11/09.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

typedef void(^progressBlock)(CGFloat progress);  // 方便获取下载占比

@interface LFLImageView : UIImageView

- (void)LFL_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder progress:(progressBlock)progress completed:(SDWebImageCompletionBlock )completedBlock;

@end
