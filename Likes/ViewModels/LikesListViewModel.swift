//
//  LikesListViewModel.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/11/08.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import TwitterKit
import RxSwift
import RxCocoa
import RxDataSources

struct LikesListViewModel {
    var items: Observable<[LikesListModel]>
    
    init() {
        items = SearchAPIClient.search()
    }
}
