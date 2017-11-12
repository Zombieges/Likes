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
    public let dataSource: RxTableViewSectionedReloadDataSource<SectionModel<String, LikesListModel>>
    public var items: Observable<[SectionModel<String, LikesListModel>]> = Observable.empty()
    
    init() {
        dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, LikesListModel>>(
            configureCell: { (dataSource, table, indexPath, element) in
                let cell = table.dequeueReusableCell(withIdentifier: "cell")!
                cell.textLabel?.text = "\(element.test1) @ row \(indexPath.row)"
                return cell
            }
        )
        dataSource.titleForHeaderInSection = { dataSource, sectionIndex in
            return dataSource[sectionIndex].model
        }
        
        items = Observable.just([
            SectionModel(model: "First section", items: [
                LikesListModel(1.0, 2.0),
                LikesListModel(2.0, 3.0)
                ]),
            SectionModel(model: "Second section", items: [
                LikesListModel(1.0, 2.0),
                LikesListModel(2.0, 3.0)
                ]),
            SectionModel(model: "Third section", items: [
                LikesListModel(1.0, 2.0),
                LikesListModel(2.0, 3.0)
                ])
            ])

    }
}
