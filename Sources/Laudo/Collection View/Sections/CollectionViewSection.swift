//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

import UIKit

// MARK: - Types
@available(iOS 13.0, *)
public typealias BaseDataSourceSnapshot = NSDiffableDataSourceSnapshot<BaseCollectionViewSection, AnyHashable>


@available(iOS 13.0, *)
public protocol CollectionViewSectionType: Hashable {
    associatedtype Item
    
    func registerCells(in collectionView: UICollectionView)
    func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
    func cell(for item: Item, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell?
    func supplementaryView(kind: String, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionReusableView?
}


@available(iOS 13.0, *)
open class BaseCollectionViewSection: CollectionViewSectionType {
    
    private let id = UUID()
    
    public init() { }
    
    open func registerCells(in collectionView: UICollectionView) {
          
    }
    
    open func layout(environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        return nil
    }
    
    open func supplementaryView(kind: String, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionReusableView? {
        return nil
    }
    
    
    open func cell(for item: AnyHashable, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell? {
        return nil
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: BaseCollectionViewSection, rhs: BaseCollectionViewSection) -> Bool {
        return lhs.id == rhs.id
    }
}
