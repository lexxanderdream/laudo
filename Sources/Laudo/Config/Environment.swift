//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//


public enum Environment: String {
    
    // MARK: - Environments
    case development
    case staging
    case production
    
    // MARK: - Current Environment
    static let current: Environment = {
        // Read Value From Info.plist
        guard let value = Bundle.main.infoDictionary?["CONFIGURATION"] as? String else {
            // Define Environment based on debug release
            if Config.debug {
                return .development
            } else {
                return .production
            }
        }

        // Create Environment
        guard let environment = Environment(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Environment")
        }

        return environment
    }()
}
