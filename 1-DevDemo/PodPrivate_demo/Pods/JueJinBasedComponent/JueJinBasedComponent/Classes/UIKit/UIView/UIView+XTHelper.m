//
//  UIView+XTHelper.m
//  JueJinBasedComponentCode_Demo
//
//  Created by DragonLi on 2018/3/12.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "UIView+XTHelper.h"
#import <objc/runtime.h>

static char touchKey_LFL;


@implementation UIView (XTHelper)

static char touchKey_LFL;

- (void)click_XTHandleBlock:(void (^)(void))tapBlock_XT{
    UITapGestureRecognizer * tapHandle = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap_LFL:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tapHandle];
    objc_setAssociatedObject(self, &touchKey_LFL, tapBlock_XT, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)actionTap_LFL:(UITapGestureRecognizer *)tap{
    void (^block)(void) = objc_getAssociatedObject(self, &touchKey_LFL);
    if (block != nil) {
      block();
    }
}


@end
