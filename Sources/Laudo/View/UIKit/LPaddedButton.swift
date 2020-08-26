//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 28.06.2020.
//

import UIKit

open class LPaddedButton: LButton, Paddable {
    
    var verticalPadding: CGFloat = 0
    var horizontalPadding: CGFloat = 0
    
    open override var intrinsicContentSize: CGSize {
        return pad(super.intrinsicContentSize)
    }
    
    public convenience init(verticalPadding: CGFloat, horizontalPadding: CGFloat) {
        self.init()
        
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
}
