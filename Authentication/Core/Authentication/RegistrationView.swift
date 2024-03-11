//
//  RegistrationView.swift
//  Authentication
//
//  Created by Şuayip Emre on 11.03.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var passwword = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack{
            LogoView()
            
            //form fields
            VStack(spacing:24){
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .textInputAutocapitalization(.none)
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                   
                
                InputView(text: $passwword, title: "Password", placeholder: "enter your password", isSecureField: true)
                    .textInputAutocapitalization(.none)
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your Password", isSecureField: true)
                    .textInputAutocapitalization(.none)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button(action: {
                print("sign user up")
            }, label: {
                HStack{
                    Text("SIGN UP")
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
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing:3){
                    Text("Already have an account ? ")
                    Text("Sign in ")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            })
        }
    }
}

#Preview {
    RegistrationView()
}
