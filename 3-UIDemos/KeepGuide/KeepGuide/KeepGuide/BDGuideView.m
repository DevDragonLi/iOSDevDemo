/*
          https://github.com/LFL2018
 
  The File Name：BDGuideView.m
  The Creator ：Created by Dragon Li
  Creation Time：On 16/7/6.
  Copyright ：  Copyright © 2016年 . All rights reserved.
  Modify The File(修改)：
 */
#import "BDGuideView.h"
#import <CoreGraphics/CoreGraphics.h>
@interface BDGuideView ()
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) BDArrowDirection direction;
@property (nonatomic, strong) UIView *backView;
@end

@implementation BDGuideView

+ (void)showDirection:(BDArrowDirection)direction
                frame:(CGRect)frame
           imageModeFrame:(CGRect)frameM
            imageName:(NSString *)imageName
                 text:(NSString *)text{
    if(!  [[NSUserDefaults standardUserDefaults] boolForKey:text]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:text];
        BDGuideView *view=[[BDGuideView alloc]initWithOrigin:frame.origin Width:frame.size.width  Height:20 Direction: direction text:text];
        //        遮招图
        UIImageView *imageM = [[UIImageView alloc]init];
        imageM.image = [UIImage imageNamed:imageName];
        imageM.frame = frameM;
        [view addSubview:imageM];
        [view popView];
    }
}

+ (void)showDirection:(BDArrowDirection)direction
                frame:(CGRect)frame
           imageFrame:(CGRect)frameM
            imageName:(NSString *)imageName
                 text:(NSString *)text{
        if(! [[NSUserDefaults standardUserDefaults] boolForKey:text]){
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:text];
            BDGuideView *view=[[BDGuideView alloc]initWithOrigin:frame.origin Width:frame.size.width  Height:20 Direction: direction text:text];
            //        遮招图
            UIImageView *imageM = [[UIImageView alloc]init];
            imageM.image = [UIImage imageNamed:imageName];
            imageM.frame = frameM;
            imageM.contentMode = UIViewContentModeCenter;
            [view addSubview:imageM];
            [view popView];
        }
}
+ (void)showDirection:(BDArrowDirection)direction
                frame:(CGRect)frame
                 text:(NSString *)text{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:text]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:text];
        BDGuideView *view=[[BDGuideView alloc]initWithOrigin:frame.origin Width:frame.size.width  Height:20 Direction: direction text:text];
        [view popView];
    }
}
-(instancetype)initWithOrigin:(CGPoint)origin Width:(CGFloat)width Height:(float)height Direction:(BDArrowDirection)direction text:(NSString *)text
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds])
    {
        //背景颜色
        self.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha: 0.86];
        //定义显示视图的参数
        self.origin = origin;
        self.height = height;
        self.width = width;
        self.direction = direction;
        self.backView=[[UIView alloc]initWithFrame:CGRectMake(origin.x, origin.y, width, height)];
        self.backView.backgroundColor=[UIColor whiteColor];
        [self addSubview:self.backView];
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(3,3,width - 3,height - 5)];
        lable.text=text;
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:10];
        lable.textColor=[UIColor blackColor];
        lable.backgroundColor = [UIColor whiteColor];
        [self.backView addSubview:lable];
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGFloat startX = self.origin.x;
    CGFloat startY = self.origin.y;
    CGContextMoveToPoint(context, startX, startY);//设置起点
    if (_direction==BDArrowDirectionLeft1) {
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    }
    else if (_direction==BDArrowDirectionLeft2)
    {
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
        
    }
    else if (_direction==BDArrowDirectionLeft3)
    {
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
        
    }
    else if (_direction==BDArrowDirectionRight1)
    {
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
        
    }
    else if (_direction==BDArrowDirectionRight2)
    {
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
        
    }
    else if (_direction==BDArrowDirectionRight3)
    {
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
        
    }
    else if (_direction==BDArrowDirectionUp1)
    {
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
        
    }
    else if (_direction==BDArrowDirectionUp2)
    {
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    }
    else if (_direction==BDArrowDirectionUp3)
    {
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    }
    else if (_direction==BDArrowDirectionDown1)
    {
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
        
    }
    else if (_direction==BDArrowDirectionDown2)
    {
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
        
    }
    else if (_direction==BDArrowDirectionDown3)
    {
        CGContextAddLineToPoint(context, startX - 5, startY -5.5);
        CGContextAddLineToPoint(context, startX +5, startY-5.5);
    }
    
    CGContextClosePath(context);
    [self.backView.backgroundColor setFill];
    [self.backgroundColor setStroke];
    CGContextDrawPath(context, kCGPathFill); // 无边框
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.backView]) {
        [self dismiss];
    }
}

-(void)popView
{
    NSArray *result=[self.backView subviews];
    for (UIView *view in result) {
        view.hidden=YES;
    }
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    //动画效果弹出
    self.alpha = 0;
    if (_direction==BDArrowDirectionLeft1) {
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x+5, self.origin.y-20, self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionLeft2)
    {
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x+5, self.origin.y-self.height/2, self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionLeft3)
    {
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x+5, self.origin.y-self.height+20, self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionRight1)
    {
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x-5, self.origin.y-20, -self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionRight2)
    {
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x-5, self.origin.y-self.height/2, -self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionRight3)
    {
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x-5, self.origin.y-self.height+20, -self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionUp1)
    {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x-20, self.origin.y+5, self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionUp2)
    {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [self frameLFL:CGRectMake(self.origin.x-self.width/2, self.origin.y+5, self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionUp3)
    {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [self frameLFL: CGRectMake(self.origin.x+20, self.origin.y+5, -self.width,self. height)];
    }
    else if (_direction==BDArrowDirectionDown1)
    {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [self frameLFL: CGRectMake(self.origin.x-20, self.origin.y-5, self.width,-self. height)];
    }
    else if (_direction==BDArrowDirectionDown2)
    {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [self frameLFL: CGRectMake(self.origin.x-self.width/2, self.origin.y-5, self.width,-self. height)];
    }
    else if (_direction==BDArrowDirectionDown3)
    {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
    [self frameLFL:CGRectMake(self.origin.x-self.width+20, self.origin.y-5, self.width,-self. height)];
    }
}

#pragma mark =========================私有方法
// animation 0.2
- (void)frameLFL:(CGRect)frame {
    [UIView animateWithDuration:.2 animations:^{
        self.alpha = 1;
        self.backView.frame = frame;
    }completion:^(BOOL finished) {
        NSArray *result=[self.backView subviews];
        for (UIView *view in result) {
            view.hidden=NO;
        }
    }];
}
-(void)dismiss{
    
    NSArray *result=[self.backView subviews];
    for (UIView *view in result) {
        [view removeFromSuperview];
    }
    
    //动画效果淡出
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 0;
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

@end


