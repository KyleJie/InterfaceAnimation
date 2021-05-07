//
//  AppDelegate.swift
//  InterfaceAnimation
//
//  Created by NightSword on 7/5/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

