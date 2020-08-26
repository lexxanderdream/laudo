//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.08.2020.
//

import StoreKit

public extension SKProduct {
    
    /// - returns: The cost of the product formatted in the local currency.
    var localizedPrice: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        return formatter.string(from: self.price)
    }
    
    func localizedPrice(_ price: NSNumber) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        return formatter.string(from: price)
    }
}
