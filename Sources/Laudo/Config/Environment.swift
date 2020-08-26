//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//


public enum Environment {
    
    // MARK: - Environments
    case development
    case production
    
    // MARK: - Current Environment
    static let current: Environment = {
        return Environment.development
    }()
}



/*
enum Environment: String {

    // MARK: - Environments

    case staging
    case production

    // MARK: - Current Environment

    static let current: Environment = {
        // Read Value From Info.plist
        guard let value = Bundle.main.infoDictionary?["CONFIGURATION"] as? String else {
            fatalError("No Configuration Found")
        }

        // Extract Environment
        guard let rawValue = value.split(separator: "/").last else {
            fatalError("Invalid Environment")
        }

        // Create Environment
        guard let environment = Environment(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Environment")
        }

        return environment
    }()
}
*/
