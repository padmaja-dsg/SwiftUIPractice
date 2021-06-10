//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var nameText = ""
    @State private var ageText = ""
    
    @EnvironmentObject var viewModel: UsersViewModel
    @State private var showFields = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if showFields {
                        VStack(alignment: .center) {
                            TextField("Name", text: $nameText).textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("Age", text: $ageText).textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: {
                                viewModel.addUser(name: nameText, age: ageText)
                            }, label: {
                                Text("Submit")
                            })
                            .disabled(nameText.isEmpty || ageText.isEmpty)
                            .padding()
                        }
                        .padding()
                    }
                    
                    VStack(alignment: .leading) {
                        ForEach(viewModel.users) { user in
                            VStack(alignment: .leading) {
                                Text(user.name)
                                Text(user.age)
                            }
                            .padding(5)
                        }
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                    
                    Spacer()
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding()
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
        let usersViewModel = UsersViewModel()
        usersViewModel.createMockData()
        return ContentView()
            .environmentObject(usersViewModel)
    }
}
#endif
