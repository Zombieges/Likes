//
//  AppDelegate.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/10/30.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import UIKit
import CoreData
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        try! loadTwitterSettings()
        
        Twitter.sharedInstance().start(
            withConsumerKey: TwitterSettingsContainer.settings.consumerKey,
            consumerSecret: TwitterSettingsContainer.settings.consumerSecret
        )
        
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.window?.rootViewController = vc
        
        return true
    }
    
    func loadTwitterSettings() throws {
        guard let url = Bundle.main.path(forResource: "Twitter", ofType: "plist") else {
            return
        }
        let settings = URL(fileURLWithPath: url)
        let data = try Data(contentsOf: settings)
        let decoder = PropertyListDecoder()
        TwitterSettingsContainer.settings = try decoder.decode(TwitterSettings.self, from: data)
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}

