//
//  UserListViewModelTests.swift
//  SwiftUIPracticeTests
//
//  Created by Padmaja Unnam on 6/11/21.
//

import XCTest
@testable import SwiftUIPractice

class UserListViewModelTests: XCTestCase {

    var viewModel: UserListViewModel!
    
    override func setUpWithError() throws {
        viewModel = UserListViewModel(context: PersistenceController.preview.container.viewContext)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddUser() {
        //TODO: Use mock 
        viewModel.addUser(name: "Test Name", age: "20", designation: "Test Designation")
    }

}
