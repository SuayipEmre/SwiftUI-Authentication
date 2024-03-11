//
//  AuthViewModel.swift
//  Authentication
//
//  Created by Şuayip Emre on 11.03.2024.
//

import Foundation
import Firebase

class AuthViewModel : ObservableObject{
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    
    
    init() {
        
    }
    
    func signIn(withEmail email : String, password : String) async throws{
        
    }
    
    
    func createUser(withEmail email:String, password : String, fullname : String)  async throws{
        print("user creating")
    }
    
    func signOut(){
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        
    }
}
