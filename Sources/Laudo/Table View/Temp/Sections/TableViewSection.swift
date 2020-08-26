//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.06.2020.
//

import UIKit
/*
@available(iOS 13.0, *)
open class TableViewSection<Item: Hashable, TableViewCell: UITableViewCell>: BaseTableViewSection {
    
    // MARK: - Types
    public typealias LayoutConfigurator = ((NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection)
    public typealias CellConfigurator = (Item, TableViewCell) -> Void
    
    
    // MARK: - Internal Properties
    private let cellIdentifier = String(describing: TableViewCell.self)
    private let cellConfigurator: CellConfigurator
    
    
    // MARK: - Initialization
    public init(cell: @escaping CellConfigurator) {
        self.cellConfigurator = cell
    }
    
    
    // MARK: - Overrides
    open override func registerCells(in tableView: UITableView) {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    open override func cell(for item: AnyHashable, at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell? {
        guard let item = item as? Item else { return nil }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else { return nil }
        
        cellConfigurator(item, cell)
        
        return cell
    }
}

@available(iOS 13.0, *)
public extension TableViewSection where TableViewCell: ConfigurableCell, TableViewCell.Item == Item {
    convenience init(a: Int = 0) {
        // Create default cell configurator
        self.init(cell: { (item, cell) in
            cell.configure(with: item)
        })
    }
}
*/
