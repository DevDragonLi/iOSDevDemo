
##  iOS-adapter-iPhone X (interface)

### Custom keyboard (布局)

```
_emotionKeyboard = [[XTEmotionKeyboard alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, (kScreenHeight == IPHONE_X_HEIGHT) ? 333 : 216)];

```

- 全局类处理`nav`,`bar` 等

```

@interface XituGlobalConst : NSObject

IPHONE_X 为宏定义 ,只需要判断高度是否812即可

/**
 默认均为64 , IPHONE_X_为 84
 */
+ (CGFloat)navBarHeight;
/**
 默认均为49 , IPHONE_X_为 49+34
 */
+ (CGFloat)tabBarHeight;

/**
 获取当前系统版本
 */
+ (CGFloat)currentVersion;


+ (CGFloat)navBarHeight{
    if (IPHONE_X_HEIGHT == kScreenHeight) {
        return 88.0;
    } else {
        return 64.0;
    }
}

+ (CGFloat)tabBarHeight{
    if (IPHONE_X_HEIGHT == kScreenHeight) {
        return 82.0;  // 
    } else {
        return 49.0;
    }
}

+ (CGFloat)currentVersion{
    return (CGFloat) [UIDevice currentDevice].systemVersion.floatValue;
}


```

- 具体使用


```

1.Swift

XituGlobalConst.navBarHeight()

XituGlobalConst.tabBarHeight()

2. OC

[XituGlobalConst navBarHeight]

[XituGlobalConst tabBarHeight]

3.
[XituGlobalConst currentVersion] 

4.  special example 
 
  NSInteger value = FOURVALUE_XITU;
if (IPHONE_X_HEIGHT == kScreenHeight) value = FOURVALUE_XITU + 20;

```