//
//  ViewController.m
//  LFLRandomCodeView
//
//  Created by vintop_xiaowei on 2016/11/10.
//  Copyright © 2016年 vintop_DragonLi. All rights reserved.
//

/**
                     绘制图片随机验证码
                     https://github.com/LFL2018
 */
#import "ViewController.h"
#import "LFLRandomCodeView.h"

@interface ViewController ()
{
    LFLRandomCodeView *_randomCodeView;
    UITextField       *_textField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绘制图片随机验证码Demo";
    [self LayoutSubviews];
}
- (void)LayoutSubviews{
    CGFloat begainX = 100;
    _randomCodeView = [[LFLRandomCodeView alloc] initWithFrame:CGRectMake(begainX, 100, 100, 40)];
    _textField = [[UITextField alloc]init];
    _textField.frame = CGRectMake(begainX, 200, 120, 30);
    _textField.placeholder = @"输入验证码";
    
    UIButton *makeSureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [makeSureButton setTitle:@"验证" forState:UIControlStateNormal];
    makeSureButton.frame = CGRectMake(begainX, 300, 100, 40);
    makeSureButton.backgroundColor = [UIColor redColor];
    [makeSureButton addTarget:self action:@selector(makeSureHandele) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_randomCodeView];
    [self.view addSubview:_textField];
    [self.view addSubview:makeSureButton];
}
#pragma mark =========================handele method
/**
 用户点击确认是否输入正确 block 回调结果,处理即可
 */
- (void)makeSureHandele{
    __weak typeof(self) ws=self;
    [_randomCodeView isInputCorrectWithString:_textField.text :^(NSString *statusSTring) {
        UIAlertView * alertView= [[UIAlertView alloc]initWithTitle:nil message:statusSTring delegate:ws cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }];
}
@end
