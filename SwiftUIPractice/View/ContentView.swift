//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var fields = EntryFields()
    
    @ObservedObject var viewModel: UserListViewModel
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var showFields = false
    
    //Core Data
    @FetchRequest(
        entity: UserEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \UserEntity.name, ascending: true),
            NSSortDescriptor(keyPath: \UserEntity.age, ascending: false)
        ]
    ) var users: FetchedResults<UserEntity>
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if showFields {
                        EntryFormView(name: $fields.name,
                                      age: $fields.age,
                                      designation: $fields.designation)
                        
                        Button(action: {
                            viewModel.addUser(name: fields.name,
                                              age: fields.age,
                                              designation: fields.designation)
                        }, label: {
                            Text("Submit")
                        })
                        .disabled(fields.name.isEmpty || fields.age.isEmpty || fields.designation.isEmpty)
                        .padding()
                    }
                    
                    VStack(alignment: .leading) {
                        ForEach(users) { user in
                            UserListItemView()
                                .environmentObject(user)
                        }
                    }
                    .padding()
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    showFields.toggle()
                }, label: {
                    Image(systemName: showFields ? "minus" : "plus")
                })
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let usersViewModel = UserListViewModel(context: PersistenceController.preview.container.viewContext)        
        return ContentView(viewModel: usersViewModel)
    }
}
#endif
