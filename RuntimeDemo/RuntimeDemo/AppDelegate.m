//
//  AppDelegate.m
//  RuntimeDemo
//
//  Created by DragonLi on 2018/5/21.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc]init];
    ViewController *VC =[[ViewController alloc]init];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:VC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
