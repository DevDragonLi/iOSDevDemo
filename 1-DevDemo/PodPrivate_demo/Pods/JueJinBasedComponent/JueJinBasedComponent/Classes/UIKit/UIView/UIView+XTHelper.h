//
//  UIView+XTHelper.h
//  JueJinBasedComponentCode_Demo
//
//  Created by DragonLi on 2018/3/12.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XTHelper)


/**
  click view handle

 @param tapBlock_XT tapBlock_XT
 */
-(void)click_XTHandleBlock:(void (^)(void))tapBlock_XT;

@end
