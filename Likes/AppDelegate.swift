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
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        try! loadTwitterSettings()
        
        Twitter.sharedInstance().start(
            withConsumerKey: TwitterSettingsContainer.settings.consumerKey,
            consumerSecret: TwitterSettingsContainer.settings.consumerSecret
        )
        
        addAccount()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return Twitter.sharedInstance().application(app, open: url, options: options)
    }
}

extension AppDelegate {
    func addAccount() {
        Twitter.sharedInstance().logIn(completion: { (session, error) in
            if let sess = session {
                print("signed in as \(sess.userName)");
            } else {
                //Twitter をインストールしていない場合
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
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
}

