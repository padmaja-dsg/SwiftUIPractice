//
//  EntryFormView.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/11/21.
//

import SwiftUI

class EntryFields: ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var designation: String = ""
}

struct EntryFormView: View {
    
    @Binding var name: String
    @Binding var age: String
    @Binding var designation: String
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Age", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Designation", text: $designation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(name: .constant("as"), age: .constant("qwerqw"), designation: .constant("asfasdfasdf"))
            .previewLayout(.sizeThatFits)
    }
}
