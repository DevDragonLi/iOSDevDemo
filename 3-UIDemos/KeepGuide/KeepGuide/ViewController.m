//
//  ViewController.m
//  KeepGuide
//
//  Created by vintop_xiaowei on 2016/9/12.
//  Copyright © 2016年 vintop_DragonLi. All rights reserved.
//

#import "ViewController.h"
#import "TextTipViewController.h"
#import "BDGuideView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat ScreenWidthFB = [UIScreen mainScreen].bounds.size.width;
    
//      这个项目中如果居中,比较麻烦点,因为图片不一样大....
    UIImageView *addIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidthFB - 40, 200, 30, 30)];
    addIamgeView.image = [UIImage imageNamed:@"yue"];
    addIamgeView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:addIamgeView];
    
    
//    test yue
     [BDGuideView showDirection:BDArrowDirectionDown3 frame:CGRectMake(ScreenWidthFB -20,200,100, 20) imageFrame:CGRectMake(ScreenWidthFB - 40,200,30, 30) imageName:@"yueLiang" text:@"Test BDGuideView TEXT。"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TextTipViewController *VC = [TextTipViewController new];
    VC.view.backgroundColor = [UIColor cyanColor];
    [self.navigationController pushViewController:VC animated:YES];
}



@end
