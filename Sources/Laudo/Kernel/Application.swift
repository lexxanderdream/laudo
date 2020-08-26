//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit
import Swinject

open class Application: UIApplication {
    
    // MARK: - Container
    private let container = Container()
    
    // MARK: - Initialization
    public override init() {
        super.init()
    }
    
    // MARK: - Methods
    public func run(serviceProviders: [ServiceProvider.Type]) {
        registerServices(providers: serviceProviders)
    }
    
    // MARK: - Helper Methods
    private func registerServices(providers: [ServiceProvider.Type]) {
        providers.forEach { (providerType) in
            let provider = providerType.init(container: container)
            print("Register service", providerType)
            provider.register()
        }
    }
}

// MARK: - Version and build
extension Application {
    open var version: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    open var build: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    open var versionString: String {
        return "Version \(version) (\(build))"
    }
}

// MARK: - Service Locator
extension Application {
    
    open func resolve<Service>(_ serviceType: Service.Type) -> Service {
        return container.resolve(serviceType)!
    }
    
    open func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service {
        return container.resolve(serviceType, name: name)!
    }
}
