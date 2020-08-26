//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.08.2020.
//

import Foundation
import StoreKit

public protocol LIAPManager {
    // MARK: - Properties
    var products: [SKProduct] { get }
    
    // MARK: - Methods
    func setup(completion: @escaping(Bool) -> Void)
    func fetchProducts(identifiers: Set<String>)
    func purchase(product identifier: String)
    func restore()
}

// MARK: - IAPManager
open class LIAPManagerImpl: NSObject, LIAPManager {
    
    // MARK: - Singletone
    
  //  static let shared = LIAPManagerImpl()
        
    
    // MARK: - Properties
    public var products: [SKProduct] = [] {
        didSet {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: LIAPManagerNotification.productsChange, object: nil)
            }
        }
    }
    
    var isAuthorizedForPayments: Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    
    // MARK: -
    
    private let paymentQueue = SKPaymentQueue.default()
    
    
    // MARK: - Public Methods
    
    public func setup(completion: @escaping(Bool) -> Void) {
        if isAuthorizedForPayments {
            paymentQueue.add(self)
            completion(true)
            return
        }
        
        completion(false)
    }
    
    public func fetchProducts(identifiers: Set<String>) {
    
        // Initialize the product request with the above identifiers.
        let productRequest = SKProductsRequest(productIdentifiers: identifiers)
        productRequest.delegate = self
        
        // Send the request to the App Store.
        productRequest.start()
    }
    
    public func purchase(product identifier: String) {
        guard let product = products.filter({ $0.productIdentifier == identifier }).first else { return }
        
        let payment = SKPayment(product: product)
        
        /*
        mutablePayment = SKMutablePayment(product: product)
        mutablePayment.quantity = 2
        */
        
        paymentQueue.add(payment)
    }
    
    public func restore() {
        paymentQueue.restoreCompletedTransactions()
    }
}

// MARK: - SKPaymentTransactionObserver
extension LIAPManagerImpl: SKPaymentTransactionObserver {
    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            switch transaction.transactionState {
                
            // The purchase in process
            case .purchasing: break
            
            // Deferred
            case .deferred: break
            
            // The purchase was successful.
            case .purchased: completed(transaction: transaction)
            
            // The transaction failed.
            case .failed: failed(transaction: transaction)
                
            // There are restored products.
            case .restored: restored(transaction: transaction)
                
            // Default case
            @unknown default:
                fatalError("Unknown state")
            }
        }
    }
    
    public func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        print("restore failed: \(error.localizedDescription)")
    }
    
    public func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        print("finished restore")
    }
    
    private func failed(transaction: SKPaymentTransaction) {

        // Ignore cancellation
        if (transaction.error as? SKError)?.code != .paymentCancelled {
            
            // Post error notification
            if let error = transaction.error {
                NotificationCenter.default.post(name: LIAPManagerNotification.paymentTransactionFailed, object: self, userInfo: ["error": error, "message": "\(error.localizedDescription)"])
            }
        }
        
        // Finish transaction.
        paymentQueue.finishTransaction(transaction)
    }
    
    private func completed(transaction: SKPaymentTransaction) {
        
        // Send notification.
        NotificationCenter.default.post(name: LIAPManagerNotification.productPurchased, object: self, userInfo: ["productIndentifier": transaction.payment.productIdentifier])
        
        // Finish transaction.
        paymentQueue.finishTransaction(transaction)
    }
    
    private func restored(transaction: SKPaymentTransaction) {
        
        // Finish transaction.
        paymentQueue.finishTransaction(transaction)
    }
    
}

// MARK: - SKProductsRequestDelegate
extension LIAPManagerImpl: SKProductsRequestDelegate {
    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        // Available products
        if !response.products.isEmpty {
            self.products = response.products
        }
        
        // Invalid products
        if !response.invalidProductIdentifiers.isEmpty {
            print("Invalid product identifiers", response.invalidProductIdentifiers)
        }
    }
}
