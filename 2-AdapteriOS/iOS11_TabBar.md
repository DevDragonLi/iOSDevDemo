## iOS 11 适配 tabbar 跳转界面

- 跳转界面, tabbar 会跳跃
- 可以自定义tabbar解决


```objc

#import <UIKit/UIKit.h>

@interface XTUITabBar : UITabBar

@end



#import "XTUITabBar.h"

@implementation XTUITabBar


- (void)setFrame:(CGRect)frame
{
    if (self.superview &&CGRectGetMaxY(self.superview.bounds) !=CGRectGetMaxY(frame)) {
        frame.origin.y =CGRectGetHeight(self.superview.bounds) -CGRectGetHeight(frame);
    }
    [super setFrame:frame];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.translucent =false;
    }
    return self;
}

@end




```
