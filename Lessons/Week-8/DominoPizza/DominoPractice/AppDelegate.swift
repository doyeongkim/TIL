//
//  AppDelegate.swift
//  DominoPractice
//
//  Created by Solji Kim on 10/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = .white
        
        let categoryVC = UINavigationController(rootViewController: CategoryViewController())
        categoryVC.tabBarItem.title = "Domino's"
        
        let wishListVC = UINavigationController(rootViewController: WishListViewController())
        wishListVC.tabBarItem.title = "Wish List"
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [categoryVC, wishListVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

