//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 02.06.2020.
//

import UIKit

@available(iOS 13.0, *)
open class HeterohenousCollectionViewSection: BaseCollectionViewSection {

    // MARK: - Types
    public typealias CellTypeResolver = ((IndexPath) -> UICollectionViewCell.Type)
    public typealias LayoutConfigurator = ((NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection)
    public typealias CellConfigurator = (AnyHashable, UICollectionViewCell) -> Void
    
    
    // MARK: - Internal Properties
    private let cellTypeResolver: CellTypeResolver
    private let layoutConfigurator: LayoutConfigurator
    private let cellConfigurator: CellConfigurator
    
    
    // MARK: - Initialization
    public init(layout: @escaping LayoutConfigurator, cellType: @escaping CellTypeResolver, cell: @escaping CellConfigurator) {
        self.layoutConfigurator = layout
        self.cellConfigurator = cell
        self.cellTypeResolver = cellType
    }
    
    
    // MARK: - Overrides
    open override func registerCells(in collectionView: UICollectionView) {
        
    }
    
    open override func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return layoutConfigurator(environment)
    }
    
    open override func cell(for item: AnyHashable, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell? {
        let cellType = cellTypeResolver(indexPath)
        let cellIdentifier = String(describing: cellType)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        cellConfigurator(item, cell)
        
        return cell
    }

}
