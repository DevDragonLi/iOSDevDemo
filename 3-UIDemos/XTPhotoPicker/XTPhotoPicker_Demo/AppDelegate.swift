//
//  AppDelegate.swift
//  XTPhotoPicker_Demo
//
//  Created by DragonLi on 2018/4/8.
//  Copyright © 2018年 DragonLi. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init()
        let vc = ViewController()
        window?.rootViewController = UINavigationController.init(rootViewController: vc)
        window?.makeKeyAndVisible()
        return true
    }
    
}

