//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.08.2020.
//

import Foundation

public struct LIAPManagerNotification {
    // MARK: - Constants
    public static let productsChange = Notification.Name(rawValue: "IAPProductsChange")
    public static let paymentTransactionFailed = Notification.Name(rawValue: "IAPTransactionFailed")
    public static let productPurchased = Notification.Name(rawValue: "IAPProductPurchased")
}
