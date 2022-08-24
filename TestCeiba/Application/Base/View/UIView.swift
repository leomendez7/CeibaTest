//
//  UIView.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = ColorScheme.shadow.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
    
}
