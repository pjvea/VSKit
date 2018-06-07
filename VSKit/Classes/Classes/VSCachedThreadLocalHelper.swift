//
//  VSCachedThreadLocalHelper.swift
//  VSKit
//
//  Created by PJ Vea on 6/6/18.
//  Copyright © 2018 Vea Software. All rights reserved.
//

import Foundation

open class VSCachedThreadLocalHelper {
    /// Helper method to create cached thread local objects.
    /// https://gist.github.com/kristopherjohnson/6f14a50006127424faf3
    ///
    /// - Parameters:
    ///   - key: Unique key for the cached object.
    ///   - create: Type of object to create.
    /// - Returns: Return a cached thread local object.
    public static func cachedThreadLocalObjectWithKey<T: AnyObject>(key: String, create: () -> T) -> T {
        guard let bundleId = Bundle.main.bundleIdentifier else {
            assert(false, "bundleId must not be nil")
            return create()
        }
        let keyWithBundleId = bundleId + "." + key
        if let cachedObj = Thread.current.threadDictionary[keyWithBundleId] as? T {
            return cachedObj
        } else {
            let newObject = create()
            Thread.current.threadDictionary[keyWithBundleId] = newObject
            return newObject
        }
    }
}
