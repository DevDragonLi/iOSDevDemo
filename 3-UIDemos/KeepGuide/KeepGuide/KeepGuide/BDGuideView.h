/*
  The File Name：BDGuideView.h
  The Creator ：Created by Dragon Li
  Creation Time：On 16/7/6.
  Copyright ：  Copyright © 2016年 . All rights reserved.

         https://github.com/LFL2018
 
 [BDGuideView showDirection:BDArrowDirectionDown2 frame:CGRectMake((ScreenWidthFB)/2 - 22 , ScreenHeightFB - 44,100, 20) currentVC:self imageFrame:CGRectMake((ScreenWidthFB)/2 , ScreenHeightFB - 44,100, 20) imageName:nil text:@"引导，从这里开始."];
 
 [BDGuideView showDirection:BDArrowDirectionUp2 frame:CGRectMake(100, ReaVal(165),100, 20) currentVC:self text:@"点击可更换背景图。"];

 */

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,BDArrowDirection){
    //箭头位置
    BDArrowDirectionLeft1=1,///左上
    BDArrowDirectionLeft2,///左中
    BDArrowDirectionLeft3,//左下
    BDArrowDirectionRight1,//右上
    BDArrowDirectionRight2,//右中
    BDArrowDirectionRight3,//右下
    BDArrowDirectionUp1,//上左
    BDArrowDirectionUp2,//上中
    BDArrowDirectionUp3,//上右
    BDArrowDirectionDown1,//下左
    BDArrowDirectionDown2,//下中
    BDArrowDirectionDown3,//下右
};

@interface BDGuideView : UIView
/**
*  显示用户引导 ,单纯文字
*
*  @param direction 方向,查看枚举
*  @param frame     坐标位置  =====  文本坐标
*  @param text      显示文本
*  @param currentVC 当前控制器
*/
+ (void)showDirection:(BDArrowDirection)direction
                frame:(CGRect)frame
                 text:(NSString *)text;
/// 显示用户引导,再加 对应图片遮招----- 图片不居中显示
+ (void)showDirection:(BDArrowDirection)direction
                frame:(CGRect)frame
           imageFrame:(CGRect)frameM
            imageName:(NSString *)imageName
                 text:(NSString *)text;
/// 显示用户引导,图片居中显示

+ (void)showDirection:(BDArrowDirection)direction
                frame:(CGRect)frame
           imageModeFrame:(CGRect)frameM
            imageName:(NSString *)imageName
                 text:(NSString *)text;


@end
