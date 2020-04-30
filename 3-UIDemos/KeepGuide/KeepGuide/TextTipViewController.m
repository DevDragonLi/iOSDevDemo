/*
  The Name Of The Project：KeepGuide
  The File Name：TextTipViewController.m
  The Creator ：Created by Dragon Li
  Creation Time：On 2016/9/12.
  Copyright ：  Copyright © 2016年 vintop_DragonLi. All rights reserved.
 File Content Description：
  Modify The File(修改)：
 */

#import "TextTipViewController.h"
#import "BDGuideView.h"

@interface TextTipViewController ()

@end

@implementation TextTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [BDGuideView showDirection:BDArrowDirectionDown1 frame:CGRectMake(100, 100, 100, 20) text:@"测试只是文字显示"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
