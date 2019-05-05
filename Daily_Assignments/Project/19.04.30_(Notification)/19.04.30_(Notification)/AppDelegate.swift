//
//  AppDelegate.swift
//  19.04.30_(Notification)
//
//  Created by Solji Kim on 01/05/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let tabBarController = UITabBarController()
        
        let firstVC = UINavigationController(rootViewController: ViewController())
        firstVC.tabBarItem.title = "Item"
        
        let secondVC = SecondViewController()
        secondVC.addNotificationObserver()
        secondVC.tabBarItem.title = "Item"
        
        tabBarController.viewControllers = [firstVC, secondVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

