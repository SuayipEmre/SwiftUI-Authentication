//
//  AuthViewModel.swift
//  Authentication
//
//  Created by Şuayip Emre on 11.03.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


@MainActor
class AuthViewModel : ObservableObject{
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    
    
    init() {
        
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email : String, password : String) async throws{
        
    }
    
    
    func createUser(withEmail email:String, password : String, fullname : String)  async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            
        }catch{
            print("failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else{return}
        
        do{
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try  snapshot.data(as: User.self)
        }catch{
            print("an error occured \(error.localizedDescription)")
        }
        
        
        
    }
}
