//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

@available(iOS 13.0, *)
open class CollectionViewSection<Item: Hashable, CollectionViewCell: UICollectionViewCell>: BaseCollectionViewSection {
    
    // MARK: - Types
    public typealias LayoutConfigurator = ((NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection)
    public typealias CellConfigurator = (Item, CollectionViewCell) -> Void
    
    
    // MARK: - Internal Properties
    private let cellIdentifier = String(describing: CollectionViewCell.self)
    private let layoutConfigurator: LayoutConfigurator
    private let cellConfigurator: CellConfigurator
    
    
    // MARK: - Initialization
    public init(layout: @escaping LayoutConfigurator, cell: @escaping CellConfigurator) {
        self.layoutConfigurator = layout
        self.cellConfigurator = cell
    }
    
    
    // MARK: - Overrides
    open override func registerCells(in collectionView: UICollectionView) {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    open override func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return layoutConfigurator(environment)
    }
    
    open override func cell(for item: AnyHashable, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell? {
        guard let item = item as? Item else { return nil }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell else { return nil }
        
        cellConfigurator(item, cell)
        
        return cell
    }
    

}

@available(iOS 13.0, *)
public extension CollectionViewSection where CollectionViewCell: ConfigurableCell, CollectionViewCell.Item == Item {
    convenience init(layout: @escaping LayoutConfigurator) {
        // Create default cell configurator
        self.init(layout: layout, cell: { (item, cell) in
            cell.configure(with: item)
        })
    }
}
