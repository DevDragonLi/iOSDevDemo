
# LFLHeadimageBrowserDemo

- [Swift Version](https://github.com/DevDragonLi/SwiftCodeRepo/tree/master/LFLHeadimageBrowserDemo)


![示意图1](savepic.gif)
![示意图2](NOpermission.gif)

- 分类处理,百行代码.(提示的文本控件,替换为当前项目的HUB即可),方便使用.

### 点击查看他人头像
- 点击后呈现,系统动画渐变过度
- 点击图片或者背景,渐变消失

### 保存头像图片的处理

- 当前用户已给予访问权限,直接保存.
- 当前用户未给予访问权限,告知暂无权限访问您的相册.
- 当前用户第一次,系统级别的对话框弹出,用户点击不,则不保存,点击了允许,则保存照片,不需要用户给予权限后再次点击保存.

## how to user 

```

Swift:

avatarImageView = UIImageView()
avatarImageView.LFLHeadimageBrowser() 
     
Objective-C:

avatarImageView = [UIImageView new];
[avatarImageView LFLHeadimageBrowser];

```


## 点击查看大图部分

```
#import "UIImageView+LFLHelper.h"
#import <Photos/Photos.h>

#define LFLANIMATEDURATION 0.3

static CGRect originFrame;

@implementation UIImageView (LFLHelper)

- (void)LFLHeadimageBrowser{
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeadimageHandle)]];
}

- (void)tapHeadimageHandle{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    originFrame = [self convertRect:self.bounds toView:window];
    NSLog(@"oldframe%@",NSStringFromCGRect(originFrame));
    backgroundView.backgroundColor =[UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:originFrame];
    imageView.tag = 1111;
    [imageView setImage:self.image];
    
    UIButton *saveButton = [[UIButton alloc] init];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveButton.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.90f];
    saveButton.layer.cornerRadius = 5;
    saveButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    saveButton.clipsToBounds = YES;
    saveButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 25, [UIScreen mainScreen].bounds.size.height - 60, 50, 25);
    [saveButton addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(saveCurrentImageClick)]];
    
    [backgroundView addSubview:saveButton];
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    [backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAction:)]];
    //  view big  eadimageBrowser
    [UIView animateWithDuration:LFLANIMATEDURATION animations:^{
        CGFloat y,width,height;
        y = ([UIScreen mainScreen].bounds.size.height - self.image.size.height * [UIScreen mainScreen].bounds.size.width / self.image.size.width) * 0.5;
        width = [UIScreen mainScreen].bounds.size.width;
        
        height = self.image.size.height * [UIScreen mainScreen].bounds.size.width / self.image.size.width;
        [imageView setFrame:CGRectMake(0, y, width, height)];
    } completion:nil];
}

- (void)dismissAction:(UITapGestureRecognizer *)tapRecognizer{
    UIView *backgroundView= tapRecognizer.view;
    [UIView animateWithDuration:LFLANIMATEDURATION animations:^{
        [[backgroundView viewWithTag:1111] setFrame:originFrame];
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}

```



##点击查看大图部分
-  如果针对第三种情况再写保存代码有重复,所以我采取了递归处理,避免了重复代码的出现,考虑到实际情况(因为系统框询问只弹出一次),递归一次就终结.

```

- (void)saveCurrentImageClick{
    __weak typeof(self) weakSelf = self;
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:weakSelf.image];
        req = nil;
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // tips message
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            UILabel *tipsLabel = [[UILabel alloc] init];
            tipsLabel.textColor = [UIColor whiteColor];
            tipsLabel.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.90f];
            tipsLabel.layer.cornerRadius = 5;
            tipsLabel.clipsToBounds = YES;
            tipsLabel.bounds = CGRectMake(0, 0, 200, 30);
            tipsLabel.center = window.center;
            tipsLabel.textAlignment = NSTextAlignmentCenter;
            tipsLabel.font = [UIFont boldSystemFontOfSize:17];
            [window addSubview:tipsLabel];
            [window bringSubviewToFront:tipsLabel];
            if (success) {
                tipsLabel.text = @"保存成功!";
            }else{
                if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized) {
                    tipsLabel.text = @"保存成功!";
                }else{
                // 处理第三种情况,监听用户第一次授权情况      
                    if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusNotDetermined) {
                        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                            if (status == PHAuthorizationStatusAuthorized) {
                            // 递归处理一次 , 因为系统框只弹出这一次
                                [weakSelf saveCurrentImageClick];
                                return ;
                            }
                        }];
                    }else{
                        tipsLabel.text = @"暂无权限访问您的相册!";
                    }
                }
            }
            [tipsLabel performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.0];
        });
    }];
}

```


# 3.Requirements

This library requires iOS 8.0+ and Xcode 8.0+.

# 4. 有任何问题，请及时 issues me

<dragonli_52171@163.com>
