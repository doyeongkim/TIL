//
//  AppDelegate.swift
//  19.04.05_(Fake_Kakao)
//
//  Created by Solji Kim on 08/04/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let tabBarController = UITabBarController()
        
        let firstVC = ViewController()
        let naviController = UINavigationController(rootViewController: firstVC)
        
        let secondVC = SecondViewController()
        secondVC.title = "친구추가"
        tabBarController.viewControllers = [naviController, secondVC]
        
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
                
        return true
    }

}
