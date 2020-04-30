//
//  LFLConstInlineHeader.h
//  InterviewExampleCode
//
//  Created by DragonLi on 2018/1/17.
//  Copyright © 2018年 XiTu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// example   APP  占位图片

static inline UIImage *LFLImagePlaceholder(){
    return [UIImage imageNamed:@"placeholder_image"];
}

/*               http://stackoverflow.com/questions/11985307/static-extern-and-inline-in-objective-c
 
                    作用 -> 替代宏
 static: 表示在当前文件中应用,如 static A, 在其它文件中也可以出现static A.不会导致重名的错误.
 inline.内联函数

                        解决:
 1. 解决函数调用效率的问题:
 函数之间调用，是内存地址之间的调用，当函数调用完毕之后还会返回原来函数执行的地址。函数调用有时间开销，内联函数就是为了解决这一问题。
 不用inline修饰的函数, 汇编时会出现 call 指令.调用call指令就是就需要：
 (1)将下一条指令的所在地址入栈
 (2)并将子程序的起始地址送入PC（于是CPU的下一条指令就会转去执行子程序）.
 
 优点相比于函数:
 
 1)inline函数避免了普通函数的,在汇编时必须调用call的缺点:取消了函数的参数压栈，减少了调用的开销,提高效率.所以执行速度确比一般函数的执行速度要快.
 2)集成了宏的优点,使用时直接用代码替换(像宏一样);
 
 优点相比于宏:
 
 1)避免了宏的缺点:需要预编译.因为inline内联函数也是函数,不需要预编译.
 
 2)编译器在调用一个内联函数时，会首先检查它的参数的类型，保证调用正确。然后进行一系列的相关检查，就像对待任何一个真正的函数一样。这样就消除了它的隐患和局限性。
 
 3)可以使用所在类的保护成员及私有成员。
 
 inline内联函数的说明
 
 1.内联函数只是我们向编译器提供的申请,编译器不一定采取inline形式调用函数.
 2.内联函数不能承载大量的代码.如果内联函数的函数体过大,编译器会自动放弃内联.
 3.内联函数内不允许使用循环语句或开关语句.
 4.内联函数的定义须在调用之前.
 
 */

