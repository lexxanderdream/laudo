//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.06.2020.
//

import UIKit
/*
@available(iOS 13.0, *)
open class HeterohenousTableViewSection: BaseTableViewSection {

    // MARK: - Types
    public typealias CellTypeResolver = ((IndexPath) -> UITableViewCell.Type)
    public typealias CellConfigurator = (AnyHashable, UITableViewCell) -> Void
    
    
    // MARK: - Internal Properties
    private let cellTypeResolver: CellTypeResolver
    private let cellConfigurator: CellConfigurator
    
    
    // MARK: - Initialization
    public init(cellType: @escaping CellTypeResolver, cell: @escaping CellConfigurator) {
        self.cellConfigurator = cell
        self.cellTypeResolver = cellType
    }
    
    
    // MARK: - Overrides
    open override func registerCells(in tableView: UITableView) {
        
    }
    
    open override func cell(for item: AnyHashable, at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell? {
        let cellType = cellTypeResolver(indexPath)
        let cellIdentifier = String(describing: cellType)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cellConfigurator(item, cell)
        
        return cell
    }

}
*/
