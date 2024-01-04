//
//  AppDelegate.swift
//  Tartib sohibi
//
//  Created by MacBook Pro on 04/05/23.
//

import UIKit
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        if cache.bool(forKey: "isHome") {
            let vc = HomeVC()
            window?.rootViewController = vc
        }else {
            let vc = LoginVC()
            window?.rootViewController = vc
        }
        window?.makeKeyAndVisible()
        IQKeyboardManager.shared().isEnabled = true
        return true
    }

    


}

