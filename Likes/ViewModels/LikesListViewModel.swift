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
    //public let dataSource: RxTableViewSectionedReloadDataSource<SectionModel<String, LikesListModel>>
    //public var items: Observable<SectionModel<String, LikesListModel>> = Observable.empty()
    public var items: Observable<[LikesListModel]> {
        return Observable.of(LikesListModel.dummyData)
    }

}
