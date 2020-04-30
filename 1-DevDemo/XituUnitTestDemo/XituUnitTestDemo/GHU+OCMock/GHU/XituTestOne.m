//
//  XituTestOne.m
//  XituUnitTestDemo
//
//  Created by DragonLi on 2017/7/14.
//  Copyright © 2017年 DragonLi. All rights reserved.
//
#import <GHUnitIOS/GHUnit.h>



@interface XituTestOne : GHTestCase

@end


@implementation XituTestOne


/**
 this is a smaple test case   
 */
- (void)testStrings{
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
    GHAssertNotNil(string1, nil);
    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}


/**
  OCMOck   虚拟一个不易构造或不易获取的对象进行测试。一般可以用来给构建网络请求接口的特殊返回测试，在请求不方便或者查询数据库代价太大的情况下
 */
- (void)testOCMock{
//    虚构某个类的实例
    
//    id tableviewMock = OCMClassMOck([UITableView class]);
   
//    NSLog(@"%@",tableviewMock);
    

}



@end

