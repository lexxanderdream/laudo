//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import Swinject

open class ServiceProvider {
    
    // MARK: - Properties
    public let container: Container
    
    // MARK: - Initialization
    required public init(container: Container) {
        self.container = container
    }
    
    open func boot() {
        
    }
    
    open func register() {
        
    }
}
