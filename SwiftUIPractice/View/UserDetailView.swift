//
//  UserDetailView.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/10/21.
//

import SwiftUI

struct UserDetailView: View {
    
    @EnvironmentObject var user: UserEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(1.5, contentMode: .fit)
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(user.name ?? "")
                
                Text("\(user.age)")
                
                Text(user.designation ?? "")
            }
            
            Spacer()
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
            .environmentObject(UserEntity.mock())
    }
}
