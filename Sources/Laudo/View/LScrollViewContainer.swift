//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 01.08.2020.
//

import UIKit
import Stevia

@available(iOS 12.0, *)
open class LScrollViewContainer: LView {
    
    // MARK: - Properties
    public let scrollView = LScrollView()
    public let contentView = LView()
    
    // MARK: - Overrides
    open override func initialize() {
        
        // Subviews
        subviews {
            scrollView.subviews {
                contentView
            }
        }
        
        // Layout
        scrollView.fillContainer()
        contentView.fillContainer()
        contentView.Width == scrollView.Width
    }
}
