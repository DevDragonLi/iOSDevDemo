//
//  ViewController.m
//  ReactiveObjCDemo
//
//  Created by DragonLi on 2016/12/1.
//  Copyright © 2016年 DragonLi. All rights reserved.
//
/*
 1.单个信号的变换
 对值,数量 对维度,对时间间隔
 */
#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (nonatomic ,strong)RACSignal * singal; /**<  */

@end

@implementation ViewController


- (void)methodName{
   RACSignal *singal =[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       [subscriber sendNext:@"1"];
       NSError *error;
       [subscriber sendError:error];
       [subscriber sendCompleted];
   return [RACDisposable disposableWithBlock:^{
       }];
   }];
  
    
}




- (void)viewDidLoad{
    [super viewDidLoad];
}
#pragma mark =========================1. RACSequence
- (void)RACSequence{
//  1.创建三种方式
//    1.1 return ,包装
    RACSequence *sequence1 =[RACSequence return:@1];
//    1.2 一个快,一个头
    RACSequence *sequence2 =[RACSequence sequenceWithHeadBlock:^id _Nullable{
        return @1;
    } tailBlock:^RACSequence * _Nonnull{
        return sequence1;
    }];
//    1.3 OC数组转化
    RACSequence *sequence3 = @[@1,@2].rac_sequence;
    NSLog(@"%@,%@",sequence2,sequence3);
    
    
// 2.变换 map con zip
    RACSequence *map1 =[sequence1 map:^id _Nullable(NSNumber * value) {
        return @(value.integerValue *3);
    }];
    
    RACSequence *con1 = [sequence2 concat:sequence1];
    RACSequence *meger = [RACSequence zip:@[sequence1,sequence2]];
    
    NSLog(@"%@,%@",con1,meger);
//   3. 遍历
    NSLog(@"%@",con1.head);
    for (id value in meger) {
        NSLog(@"%@",value);
    }
    
}

#pragma mark =========================RACSingal

- (void)RACSignal1{
//    1.获得信号
    
            //1.1 单元信号
    NSError *errorObject;
    RACSignal *singal =[RACSignal return:@1];
    singal = [RACSignal error:errorObject];
    singal = [RACSignal empty];
    singal = [RACSignal never];
    
                // 1.2   动态信号
    RACSignal *dynamicSingal =[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@1];
        [subscriber sendError:errorObject];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    [dynamicSingal subscribeNext:^(id  _Nullable x) {
        
    }];
    
    //1.3 COCOA层桥接
    singal = [self.view rac_signalForSelector:@selector(frame)];
    UIButton *button;
    
    singal = [button rac_signalForControlEvents:UIControlEventTouchUpInside];
    
    singal = [self rac_willDeallocSignal];
    singal = RACObserve(self.view, backgroundColor);
    
//    信号转换
    singal = [singal map:^id _Nullable(NSString *  _Nullable value) {
        return [value substringFromIndex:1];
    }];
    
    //序列转换
    singal = @[@1].rac_sequence.signal;
}


- (void)RACSignal2{
    RACSignal *singal2;
    [self.singal subscribeNext:^(id  _Nullable x) {
        
    } error:^(NSError * _Nullable error) {
        
    } completed:^{
        
    }];
    // 绑定
    RAC(self.view,backgroundColor) = self.singal;
    
    //Cocoa桥接
    // 每当singal 和singal2有值,就会调用这个SEL ,每当值变化,就会调用最新的
    [self.view rac_liftSelector:@selector(convertRect:toView:) withSignals:self.singal,singal2, nil];
    
    // 操作
    
}

@end
