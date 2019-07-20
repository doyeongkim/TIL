//
//  AppDelegate.swift
//  FirebasePractice
//
//  Created by Solji Kim on 20/07/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white

        FirebaseApp.configure()
        
        let tabBarController = UITabBarController()
        let navi = UINavigationController(rootViewController: ViewController())
        let bankSaladVC = BankSaladViewController()
        
        navi.tabBarItem = UITabBarItem(title: "Save User", image: nil, tag: 0)
        bankSaladVC.tabBarItem = UITabBarItem(title: "Bank Salad", image: nil, tag: 1)

        tabBarController.viewControllers = [navi, bankSaladVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

