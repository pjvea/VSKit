//
//  Array+Extensions.swift
//  VSKit
//
//  Created by PJ Vea on 6/6/18.
//  Copyright © 2018 Vea Software. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    public var uniqueValues: Array<Element> {
        get {
            var collection = Array<Element>()
            
            for element: Element in collection {
                if !collection.contains(element) {
                    collection.append(element)
                }
            }            
            return collection
        }
    }
}
