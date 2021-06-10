//
//  User.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/9/21.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    let name: String
    let age: String
}

extension User {
    static func mockUsers() -> [User] {
        let user1 = User(name: "One", age: "1")
        let user2 = User(name: "Two", age: "2")
        let user3 = User(name: "Three", age: "3")
        return [user1, user2, user3]
    }
}
