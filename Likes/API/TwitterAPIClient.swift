//
//  TwitterAPIClient.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/19.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import Foundation
import RxSwift
import TwitterKit

public protocol TwitterAPIClient {
    associatedtype T: Codable
    static func sendRequest(request: TwitterAPIRequest) -> Observable<T>
    static func parseResponse(from object: Data) -> T
}

extension TwitterAPIClient {
    static func sendRequest(request: TwitterAPIRequest) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            let client = TWTRAPIClient()
            var clientError : NSError?
            
            let req = client.urlRequest(withMethod: request.method,
                                        url: request.url,
                                        parameters: request.parameters,
                                        error: &clientError)
            
            client.sendTwitterRequest(req, completion: { (response, data, connectionError) -> Void in
                if connectionError != nil {
                    observer.onError(ApplicationError.apiError)
                    return
                }
                
                guard let data = data else {
                    observer.onError(ApplicationError.parseError)
                    return
                }
                
                do {
                    let list: T = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(list)
                    observer.onCompleted()
                    
                } catch {
                    observer.onError(ApplicationError.parseError)
                }
            })
            return Disposables.create()
        }
    }
}
