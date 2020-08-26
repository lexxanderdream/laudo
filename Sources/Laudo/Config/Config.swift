//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import Foundation

public struct Config {
    
    static var name: String {
        return AppInfo.CFBundleName
    }
    
    static var version: String {
        return AppInfo.CFBundleShortVersionString
    }
    
    static var build: String {
        return AppInfo.CFBundleVersion
    }
    
    public static let env: Environment = {
        return Environment.current
    }()
    
    public static let debug: Bool = {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }()
    
}
