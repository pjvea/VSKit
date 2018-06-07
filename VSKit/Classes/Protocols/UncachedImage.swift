//
//  UncachedImage.swift
//  VSKit
//
//  Created by PJ Vea on 6/6/18.
//  Copyright © 2018 Vea Software. All rights reserved.
//

import Foundation

public protocol UncachedImage {
    func getUncachedImage(named name : String) -> UIImage?
}

extension UncachedImage {
    public func getUncachedImage(named name : String) -> UIImage? {
        if let imgPath = Bundle.main.path(forResource: name, ofType: nil) {
            return UIImage(contentsOfFile: imgPath)
        }
        return nil
    }
}
