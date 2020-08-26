//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.06.2020.
//

import UIKit
/*
@available(iOS 13.0, *)
public class TableViewAdapter<Item: Hashable> {
    
    // MARK: - Internal Properties
    private let tableView: UITableView
    private lazy var dataSource: UITableViewDiffableDataSource<BaseTableViewSection, Item> = {
        return UITableViewDiffableDataSource(tableView: tableView, cellProvider: cellProvider)
    }()
    
    // MARK: - Initialization
    public init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    
    // MARK: - Cell Provider
    private func cellProvider(tableView: UITableView, indexPath: IndexPath, item: Item) -> UITableViewCell? {
        let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
        return section.cell(for: item, at: indexPath, in: tableView)
    }
}

// MARK: - Public API
@available(iOS 13.0, *)
public extension TableViewAdapter {
    
    var snapshot: NSDiffableDataSourceSnapshot<BaseTableViewSection, Item> {
        return dataSource.snapshot()
    }
    
    func apply(snapshot: NSDiffableDataSourceSnapshot<BaseTableViewSection, Item>, animated: Bool, completion: (() -> Void)? = nil) {
        dataSource.apply(snapshot, animatingDifferences: animated, completion: completion)
    }
    
    func registerCells(from sections: [BaseTableViewSection]) {
        sections.forEach { (section) in
            section.registerCells(in: tableView)
        }
    }
}
*/
