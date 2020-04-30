//
//  AppDelegate.m
//  handle_Album_Select_GIF_Demo
//
//  Created by DragonLi on 2017/12/27.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]init];
    self.window.backgroundColor =[UIColor whiteColor];
    ViewController *VC =[[ViewController alloc]init];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:VC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
