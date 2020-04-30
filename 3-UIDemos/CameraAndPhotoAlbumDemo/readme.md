###  LFLCameraAndPhotoTool

```
  LFLCameraAndPhotoTool *tool = [LFLCameraAndPhotoTool shareInstance];
    
    [tool showPhotoInViewController:self photoDataBlock:^(UIImage *image, NSData *gifData, NSString *videoPath) {
        NSLog(@"%@",image);
    }];

```
