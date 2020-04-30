//
//  ViewController.m
//  InterviewExampleCode
//
//  Created by DragonLi on 2018/1/15.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"
#import "LFLConstInlineHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    LFLImagePlaceholder()
    
//    [self dispatch_queue_tDemo];
//    [self dispatch_semaphore_tDemo];
}

/**
 多个图片上传后, block 回调 URL ,按照顺序装入新数组
 */
- (void)picsUploadDemoimages:(NSArray *)images{
    NSMutableArray *picUrlArray = [NSMutableArray array];
    for (int i = 0; i < images.count; i++) {
        [picUrlArray addObject:[NSNull null]];
    }
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t dispatchGroup = dispatch_group_create();
        for (NSInteger i = 0; i < images.count; i ++) {
//            UIImage *image = images[i];
            dispatch_group_async(dispatchGroup, queue, ^{
                dispatch_group_enter(dispatchGroup);
                [self uploadDemoSucessBlock:^(NSString *url) {
                    NSLock * lock = [[NSLock alloc]init];
                    [lock lock];
                    picUrlArray[i] = url;
                    [lock unlock];
                    dispatch_group_leave(dispatchGroup);
                } ErrorBlock:^{
                       dispatch_group_leave(dispatchGroup);
                } index:i];
            });
        }
    dispatch_group_notify(dispatchGroup, queue, ^{
       if (picUrlArray.count == images.count && picUrlArray.firstObject != nil) {
       // 已经传完毕
       }
    });
 
}


- (void)uploadDemoSucessBlock:(void (^)(NSString *))SucessBlock
                    ErrorBlock:(void (^)(void))errorBlock
                        index:(NSInteger)index{
    if (SucessBlock) {
        SucessBlock([NSString stringWithFormat:@"%ld-PicURL",index]);
    }
}

/**
 保持线程同步
 */
- (void)dispatch_queue_tDemo{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int j = 0;
    dispatch_async(queue, ^{  //
        j = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"%zd", j);

}

/**
 为线程加锁
 */
- (void)dispatch_semaphore_tDemo{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            // 加锁
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            NSLog(@"i = %zd %@", i, semaphore);
            // 解锁
            dispatch_semaphore_signal(semaphore);
        });
    }
    
}




@end
