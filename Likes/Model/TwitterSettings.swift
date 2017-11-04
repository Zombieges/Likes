//
//  TwitterSettings.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/03.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import Foundation

struct TwitterSettings: Codable {
    var consumerKey: String
    var consumerSecret: String
}

final class TwitterSettingsContainer: NSObject {
    static var settings: TwitterSettings!
}
