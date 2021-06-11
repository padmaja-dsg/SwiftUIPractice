//
//  UserEntity+Additions.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/11/21.
//

import CoreData

extension UserEntity {
    static func mock() -> UserEntity {
        let entity = UserEntity(context: PersistenceController.preview.container.viewContext)
        entity.name = "MOCK"
        entity.age = 25
        entity.designation = "Developer"
        
        return entity
    }
}
