//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit


@available(iOS 13.0, *)
public class CollectionViewAdapter<Item: Hashable> {

    // MARK: - Internal Properties
    private lazy var dataSource: UICollectionViewDiffableDataSource<BaseCollectionViewSection, Item> = {
        let dataSource = UICollectionViewDiffableDataSource<BaseCollectionViewSection, Item>(collectionView: collectionView, cellProvider: cellProvider)
        dataSource.supplementaryViewProvider = supplementaryViewProvider
        return dataSource
    }()
    
    
    // MARK: - Properties
    public lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: sectionProvider))
    }()
    
    // MARK: - Initialization
    public init() {
        
    }
    
    
    // MARK: - Cell Provider
    private func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? {
        let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
        return section.cell(for: item, at: indexPath, in: collectionView)
    }
    
    // MARK: - Section Provider
    private func sectionProvider(for sectionIndex: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let section = dataSource.snapshot().sectionIdentifiers[sectionIndex]
        return section.layout(environment: environment)
    }
    
    // MARK: - Supplementary View Provider
    private func supplementaryViewProvider(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
        return section.supplementaryView(kind: kind, at: indexPath, in: collectionView)
    }
    

}

// MARK: - Public API
@available(iOS 13.0, *)
public extension CollectionViewAdapter {
    
    var snapshot: NSDiffableDataSourceSnapshot<BaseCollectionViewSection, Item> {
        return dataSource.snapshot()
    }
    
    func apply(snapshot: NSDiffableDataSourceSnapshot<BaseCollectionViewSection, Item>, animated: Bool, completion: (() -> Void)? = nil) {
        dataSource.apply(snapshot, animatingDifferences: animated, completion: completion)
    }
    
    func registerSections(_ sections: [BaseCollectionViewSection]) {
        sections.forEach { (section) in
            section.registerCells(in: collectionView)
        }
    }
    
    /*
    public func performUpdates(animated: Bool, completion: (() -> Void)? = nil) {
        guard let delegate = delegate else { return }
        
        // Retrive sections
        let sections = delegate.sections()
        
        // Register cells
        registerSections(sections)
        
        // Initialize Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
        // Append Sections
        snapshot.appendSections(sections)
        
        // Append Items
        for section in sections {
            let items: [Item] = delegate.itemsFor(section: section)
            snapshot.appendItems(items, toSection: section)
        }
        
        // Apply Snapshot
        apply(snapshot: snapshot, animated: animated, completion: completion)
    }
    */
}
