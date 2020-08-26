//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit

public func app() -> Application {
    return UIApplication.shared as! Application
}

public func resolve<Service>(_ serviceType: Service.Type) -> Service {
    return app().resolve(serviceType)
}
