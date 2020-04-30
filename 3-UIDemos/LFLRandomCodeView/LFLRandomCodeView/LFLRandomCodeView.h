//
//  LFLRandomCodeView.h
//  LFLRandomCodeView
//
//  Created by vintop_xiaowei on 2016/11/10.
//  Copyright © 2016年 vintop_DragonLi. All rights reserved.
//              随机码view

#import <UIKit/UIKit.h>

@interface LFLRandomCodeView : UIView

/**
    是否输入正确
 @return 布尔值
 */
- (BOOL)isInputCorrectWithString:(NSString *)string :(void (^)(NSString *))complete;

@end
