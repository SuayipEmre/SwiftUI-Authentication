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
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : AuthViewModel
    
    
    
    var body: some View {
        VStack{
            LogoView()
            
            //form fields
            VStack(spacing:24){
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .textInputAutocapitalization(.none)
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                
                
                InputView(text: $password, title: "Password", placeholder: "enter your password", isSecureField: true)
                    .textInputAutocapitalization(.none)
                ZStack(alignment: .trailing){
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your Password", isSecureField: true)
                        .textInputAutocapitalization(.none)
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword{
                          Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemGreen))
                        } else{
                            Image(systemName: "xmark.circle.fill")
                                  .imageScale(.large)
                                  .fontWeight(.bold)
                                  .foregroundStyle(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button(action: {
                Task{
                    try await viewModel.createUser(withEmail: email, password: password,  fullname: fullname)
                }
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
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
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

// MARK: - AuthenticationFormProtocol

extension RegistrationView : AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && password == confirmPassword
        && !fullname.isEmpty
    }
}


#Preview {
    RegistrationView()
}
