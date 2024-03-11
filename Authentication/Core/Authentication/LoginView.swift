//
//  LoginView.swift
//  Authentication
//
//  Created by Şuayip Emre on 11.03.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var passwword = ""
    var body: some View {
        NavigationStack{
            VStack{
                // image
               LogoView()
                
                //form fields
                VStack(spacing:24){
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .textInputAutocapitalization(.none)
                    
                    InputView(text: $passwword, title: "Password", placeholder: "enter your password", isSecureField: true)
                        .textInputAutocapitalization(.none)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sign in button
                Button(action: {
                    print("log user in")
                }, label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    .foregroundStyle(.white)
                })
                .background(Color(.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 24)
                Spacer()
                
                //sign up button
                
                NavigationLink {
                   RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:3){
                        Text("Don't have an account ? ")
                        Text("Sign up ")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }

            }
        }
    }
}

#Preview {
    LoginView()
}
