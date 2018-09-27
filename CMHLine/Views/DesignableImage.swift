//
//  DesignableImage.swift
//  CMHLine
//
//  Created by luis on 9/26/18.
//  Copyright © 2018 luis. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignableImage: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
}
