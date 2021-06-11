//
//  UserListViewModel.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/10/21.
//

import Combine
import CoreData
import Foundation
import SwiftUI

class UserListViewModel: ObservableObject {
    @Published fileprivate(set) var users: [UserEntity] = []
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func addUser(name: String, age: String, designation: String) {
        let user = UserEntity(context: context)
        user.name = name
        user.age = Int16(age) ?? 0
        user.designation = designation
        PersistenceController.shared.save()
    }
}
