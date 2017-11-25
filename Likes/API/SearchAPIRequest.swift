//
//  SearchAPIRequest.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/19.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import Foundation
import TwitterKit

class FavoritesAPIRequest: TwitterAPIRequest {
    var method: String {
        return "GET"
    }
    
    var parameters: [AnyHashable : Any]? {
        guard let userId = Twitter.sharedInstance().sessionStore.session()?.userID else {
            fatalError()
            return nil
        }
        return ["user_id": userId, "count": "10"]
    }
    
    var url: String {
        return "https://api.twitter.com/1.1/favorites/list.json"
    }
}
