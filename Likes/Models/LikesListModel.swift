//
//  LikesListModel.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/08.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import RxSwift
import TwitterKit

struct LikesListModel: Codable {
    let test1: Double
    let test2: Double
    init(_ test1: Double, _ test2: Double) {
        self.test1 = test1
        self.test2 = test2
    }
    static var dummyData: LikesListModel {
        return LikesListModel(1.0, 2.0)
    }
}

extension LikesListModel {
    func request() {
        guard let twitterAccountId = Twitter.sharedInstance().sessionStore.session()?.userID else { return }
        
        let client = TWTRAPIClient(userID: twitterAccountId)
        var clientError : NSError?
        
        let request = client.urlRequest(
            withMethod: "GET",
            url: "https://api.twitter.com/1.1/favorites/list.json",
            parameters: [
                "user_id": twitterAccountId,
                "count": "10",
                ],
            error: &clientError
        )
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json: \(json)")
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
    }
}
