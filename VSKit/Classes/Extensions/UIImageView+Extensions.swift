//
//  UIImageView+Extensions.swift
//  VSKit
//
//  Created by PJ Vea on 6/6/18.
//  Copyright © 2018 Vea Software. All rights reserved.
//

import Foundation

extension UIImageView {
    public func setInitials(initials: String, isCircle: Bool = true, textColor: UIColor = .white, backgroundColor: UIColor = .lightGray) {
        let initialsLabel = UILabel()
        initialsLabel.frame.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        initialsLabel.textColor = textColor
        initialsLabel.text = initials
        initialsLabel.textAlignment = .center
        initialsLabel.backgroundColor = backgroundColor
        if isCircle == true {
            initialsLabel.layer.cornerRadius = self.frame.size.width / 2
        }
        
        UIGraphicsBeginImageContext(initialsLabel.frame.size)
        initialsLabel.layer.render(in: UIGraphicsGetCurrentContext()!)
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
