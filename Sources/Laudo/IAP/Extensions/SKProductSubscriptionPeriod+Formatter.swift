//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.08.2020.
//

import StoreKit

public extension SKProductSubscriptionPeriod {
    var localizedString: String {
        if unit == .day && numberOfUnits == 7 {
            return SKProduct.PeriodUnit.week.name(1)
        }
        
        if numberOfUnits == 1 {
            return unit.name(1)
        }
        
        return "\(numberOfUnits) \(unit.name(numberOfUnits))"
    }
}

public extension SKProduct.PeriodUnit {
    
    func name(_ numberOfUnits: Int) -> String {
        switch self {
        case .day:
            if numberOfUnits > 1 {
                return "days"
            }
            return "day"
        case .month:
            if numberOfUnits > 1 {
                return "months"
            }
            return "month"
        case .year:
            return "year"
        case .week:
            if numberOfUnits == 1 {
                return "one week"
            }
            return "week"
        default:
            return ""
        }
    }
}
