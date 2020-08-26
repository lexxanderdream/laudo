//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.06.2020.
//

public protocol ConfigurableCell {
    associatedtype Item
    func configure(with item: Item)
}
