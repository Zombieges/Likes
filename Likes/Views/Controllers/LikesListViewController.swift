//
//  ViewController.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/10/30.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import UIKit
import TwitterKit
import RxSwift
import RxCocoa
import RxDataSources

class LikesListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private var viewModel: LikesListViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LikesListViewModel()
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element.test1) @ row \(row)"
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
//        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, LikesListModel>>(
//            configureCell: { (dataSource, table, indexPath, element) in
//                let cell = table.dequeueReusableCell(withIdentifier: "cell")!
//                cell.textLabel?.text = "\(element.test1) @ row \(indexPath.row)"
//                return cell
//            }
//        )
//        dataSource.titleForHeaderInSection = { dataSource, sectionIndex in
//            return dataSource[sectionIndex].model
//        }
//        viewModel.items
//            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
//            .disposed(by: disposeBag)
        
//        tableView.rx
//            .itemSelected
//            .map { indexPath in
//                return (indexPath, self.viewModel.dataSource[indexPath])
//            }
//            .subscribe(onNext: { indexPath, model in
//
//            })
//            .disposed(by: disposeBag)
    }
}


extension LikesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

