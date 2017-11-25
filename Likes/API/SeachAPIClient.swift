//
//  SeachAPIClient.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/19.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import Foundation
import RxSwift

class SearchAPIClient: TwitterAPIClient {
    typealias T = [LikesListModel]
    
    class func search() -> Observable<[LikesListModel]> {
        return sendRequest(request: FavoritesAPIRequest())
    }
    
    static func parseResponse(from object: Data) -> [LikesListModel] {
        do {
            return try JSONDecoder().decode([LikesListModel].self, from: object)
        } catch {
            return []
        }
    }
}
