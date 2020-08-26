//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 31.05.2020.
//

import UIKit
import SDWebImage

public enum Image {
    case local(UIImage)
    case remote(URL)
}

public extension UIImageView {
    
    @discardableResult
    func image(_ image: Image, placeholderImage: UIImage? = nil) -> Self {
        switch image {
        case .local(let image):
            self.image = image
            
        case .remote(let url):
            self.sd_setImage(with: url, placeholderImage: placeholderImage)
        }
        
        return self
    }
}
