## FaceID

- iOS11之后LAContext新增biometryType属性，调用时候可以根据这个属性来判断当前设备是使用FaceID还是TouchID,并据此做UI样式上的调整
- NSFaceIDUsageDescription : Description
- FaceID如果 不间断连续尝试 次数超过5次之后，会弹窗提示如下，同时不再执行reply:对应的block

```
[context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
           localizedReason:myLocalizedReasonString
	        reply:^(BOOL success, NSError *error) {

 }];

```

## TouchID

- 在调用TouchID验证弹窗前最好先判断一下设备是否支持TouchID

```
	//创建安全验证对象
    LAContext * con = [[LAContext alloc]init];
    NSError * error;
    //判断是否支持密码验证
    /**
     * LAPolicyDeviceOwnerAuthentication 可输入手机密码的验证方式
     * LAPolicyDeviceOwnerAuthenticationWithBiometrics 只有指纹的验证方式
     */
    BOOL can = [con canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];

. LAPolicyDeviceOwnerAuthenticationWithBiometrics iOS8.0以上支持，只有指纹验证功能
. LAPolicyDeviceOwnerAuthentication iOS 9.0以上支持，包含指纹验证与输入密码的验证方式

```

- 调用

```
//初始化上下文对象
LAContext *context = [[LAContext alloc] init];
//localizedFallbackTitle＝@“”,不会出现“输入密码”按钮
context.localizedFallbackTitle = @"";
//错误对象
NSError *error = nil;
NSString *result = @"验证信息";

//判断是否支持密码验证
/**
 *LAPolicyDeviceOwnerAuthentication 手机密码的验证方式
 *LAPolicyDeviceOwnerAuthenticationWithBiometrics 指纹的验证方式
 */
if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:result reply:^(BOOL success, NSError *error) {
        if(error.code == LAErrorTouchIDLockout) {
            
            BOOL can = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
            if (can) {
                [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:result reply:^(BOOL success, NSError * _Nullable error) {
                    
                }];
                
            }
            else{
                NSLog(@"调起账号密码页面失败!!!");
            }
        }
    }];
}
1. context.localizedFallbackTitle = @"";如果不设置空值，则AlertView弹窗默认会有“输入密码”的选项，但是在LAPolicyDeviceOwnerAuthenticationWithBiometrics模式下点击“输入密码”不会有反应；LAPolicyDeviceOwnerAuthentication模式下点击可以唤起输入手机密码页面，页面如下，其中除了“指纹”两字是你的app名称，其他都不可定制


if(error.code == LAErrorTouchIDLockout) {
    BOOL can = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
    if (can) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:result reply:^(BOOL success, NSError * _Nullable error) {
        }];
    }
    else{
        NSLog(@"调起账号密码页面失败!!!");
    }
}

2.使用TouchID，必须确保app已经是活动状态！！
也即是说当你调用TouchID时，必须确保程序已经收到了UIApplicationDidBecomeActiveNotification的消息，不然的话会调用失败，返回一个错误



```
