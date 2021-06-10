//
//  UsersViewModel.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/10/21.
//

import Combine
import Foundation

class UsersViewModel: ObservableObject {
    @Published fileprivate(set) var users: [User] = []
    
    func addUser(name: String, age: String) {
        let user = User(name: name, age: age)
        users.append(user)
        users.sort(by: { $0.age > $1.age })
    }
}

#if DEBUG
extension UsersViewModel {
    func createMockData() {
        self.users = User.mockUsers().sorted(by: { $0.age > $1.age })
    }
}
#endif
