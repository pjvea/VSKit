//
//  NSPersistentContainer+Extensions.swift
//  VSKit
//
//  Created by PJ Vea on 6/6/18.
//  Copyright © 2018 Vea Software. All rights reserved.
//

import Foundation
import CoreData

@available(iOS 10.0, *)
extension NSPersistentContainer {
    /// Returns all names found in the Core Data model.
    ///
    /// - Returns: An array of entity names.
    public func getEntityNames() -> [String] {
        let names = self.managedObjectModel.entities.map({ (entity) -> String in
            if let name = entity.name {
                return name
            }
            assertionFailure("Name of entity could not retrieved.")
            return ""
        })
        return names
    }
    
    /// Drops (deletes) all objects for all entities in the Core Data model.
    ///
    /// - Parameter completion: Optional completion handler that is called when the method is finished executing.
    public func dropAllCoreDataEntities(completion: (() -> Void)? = nil) {
        let names = self.getEntityNames()
        
        for name in names {
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: name)
            let request = NSBatchDeleteRequest(fetchRequest: fetch)
            do {
                try self.viewContext.execute(request)
            } catch let error {
                assertionFailure(error.localizedDescription)
            }
        }
        if let completion = completion {
            completion()
        }
    }
}
