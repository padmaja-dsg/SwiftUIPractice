//
//  UserListItemView.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/10/21.
//

import SwiftUI

struct ViewBackgroundModifier: ViewModifier {
    
    let backgroundColor: Color
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(color: Color.black.opacity(0.2), radius: 5)
    }
}

extension View {
    func tileBackground(cornerRadius: CGFloat) -> some View {
        modifier(ViewBackgroundModifier(backgroundColor: Color.white, cornerRadius: cornerRadius))
    }
}

struct UserListItemView: View {
    
    @EnvironmentObject var user: UserEntity
    @State private var showUserDetails = false
    
    var body: some View {
        VStack {
            HStack {
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    Image(systemName: "heart")
                        .padding(-10)
                })
                .frame(width: 50, height: 50)
                .padding()
                
                VStack(alignment: .leading) {
                    Text(user.name ?? "")
                    Text(user.designation ?? "")
                }
                .padding(.leading, 10)
                
                Spacer()
                
                Text("\(user.age)")
            }
            .padding()
            .onTapGesture {
                showUserDetails = true
            }

            NavigationLink(
                destination:
                    UserDetailView()
                    .environmentObject(user)
                ,
                isActive: $showUserDetails,
                label: {
                    EmptyView()
                })
        }
        .padding()
        .tileBackground(cornerRadius: 10)
    }
}

struct UserListItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserListItemView()
            .environmentObject(UserEntity.mock())
            .previewLayout(.sizeThatFits)
    }
}
