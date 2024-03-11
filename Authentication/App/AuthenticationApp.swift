//
//  AuthenticationApp.swift
//  Authentication
//
//  Created by Şuayip Emre on 11.03.2024.
//

import SwiftUI
import Firebase


@main
struct AuthenticationApp: App {
    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
