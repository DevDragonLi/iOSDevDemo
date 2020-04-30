//
//  ViewController.m
//  GIF-Optimize
//
//  Created by DragonLi on 2017/11/9.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "ViewController.h"
#import "LFLImageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet LFLImageView *pic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testDemo];
}
- (void)testDemo{
    NSURL *URL = [NSURL URLWithString:@"https://user-gold-cdn.xitu.io/2017/11/9/62dee318aba6a80a31d5a35c15cdd977?"];
    [self.pic LFL_setImageWithURL:URL placeholderImage:nil progress:^(CGFloat progress) {
        NSLog(@"%f",progress);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"size = %@,data = %@",NSStringFromCGSize(image.size),image);
    }];
}



@end
