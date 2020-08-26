//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 28.06.2020.
//

import UIKit

open class LPaddedLabel: LLabel, Paddable {
    var verticalPadding: CGFloat = 0
    var horizontalPadding: CGFloat = 0
    
    open override var intrinsicContentSize: CGSize {
        return pad(super.intrinsicContentSize)
    }
    
    public convenience init(text: String?, font: UIFont?, verticalPadding: CGFloat, horizontalPadding: CGFloat) {
        self.init(text: text, font: font)
        
        textAlignment = .center
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
}
