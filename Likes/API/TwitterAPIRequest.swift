//
//  TwitterAPIRequest.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/19.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import Foundation

public protocol TwitterAPIRequest {
    var url: String { get }
    var method: String { get }
    var parameters: [AnyHashable : Any]? { get }
}
