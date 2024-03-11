//
//  ProfileView.swift
//  Authentication
//
//  Created by Şuayip Emre on 11.03.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section{
                HStack{
                    Text("RD")
                           .font(.title)
                           .fontWeight(.semibold)
                           .foregroundStyle(.white)
                           .frame(width: 72, height: 72)
                           .background(Color(.systemGray3))
                           .clipShape(Circle())
                    
                    VStack(alignment:.leading, spacing: 4){
                        Text("Rider Developer")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .padding(.top, 4)
                        
                        Text("riderdev@gmail.com")
                            .font(.footnote)
                            .tint(.gray)
                    }
                }
            }
            Section("General"){
                HStack{
                    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    Spacer()
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            Section("Account"){
                Button(action: {
                    print("sign out")
                }, label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemRed))
                      
                })
                .foregroundStyle(.primary)
                
                Button(action: {
                    print("delete account")
                }, label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemRed))
                      
                })
                .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    ProfileView()
}
