//
//  LFLRandomCodeView.m
//  LFLRandomCodeView
//
//  Created by vintop_xiaowei on 2016/11/10.
//  Copyright © 2016年 vintop_DragonLi. All rights reserved.
//

#import "LFLRandomCodeView.h"

@interface LFLRandomCodeView ()
{
    UILabel         *_codeLabel;
    NSMutableString *_currentStrings;
}
@end

@implementation LFLRandomCodeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =[self randomColorWithAlpha:0.2];
        NSMutableArray * codeArray = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
        
        _currentStrings = [NSMutableString string];
        for (int i = 0; i < 4; i++) {
            NSInteger indexNumber = arc4random() % ([codeArray count] - 1);
            _currentStrings =(NSMutableString *)  [_currentStrings stringByAppendingString:codeArray[indexNumber]];
            [codeArray removeObjectAtIndex:indexNumber];
        }
        NSLog(@"当前随机的code = %@",_currentStrings);
    }
    return  self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self setBackgroundColor:[self randomColorWithAlpha:.5]];
    
    NSString *text = [NSString stringWithFormat:@"%@",_currentStrings];
    CGSize cSize = [@"S" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    int width = rect.size.width / text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    CGPoint point;
    
    float pX, pY;
    for (int i = 0; i < text.length; i++)
    {
        pX = arc4random() % width + rect.size.width / text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for(int cout = 0; cout < 10; cout++)
    {
        CGContextSetStrokeColorWithColor(context, [[self randomColorWithAlpha:.5] CGColor]);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
}

- (BOOL)isInputCorrectWithString:(NSString *)string :(void (^)(NSString *))complete{
    NSString *showString ;
    BOOL status = NO;
    if (string) {
        if ([[string lowercaseString] isEqualToString:[_currentStrings lowercaseString]]) {
            status =  YES;
            showString = @"正确";
        }else{
            showString = @"错误";
        }
    }else{
        showString = @"未输入";
    }
    if (complete) {
        complete(showString);
    }
    return status;
}

// private method
- (UIColor *)randomColorWithAlpha:(CGFloat)alpha{
    float red = arc4random() % 100 / 255.0;
    float green = arc4random() % 100 / 255.0;
    float blue = arc4random() % 100 / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
