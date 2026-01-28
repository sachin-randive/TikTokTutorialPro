//
//  RegistrationViewModel.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 25/01/26.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    private let authService: AuthService
    
    init (authService: AuthService) {
        self.authService = authService
    }
    
    func createUser(withEmail email: String, password: String, username: String, fullname: String) async {
        do {
            try await authService.createUser(withEmail: email, password: password, username: username, fullname: fullname)
        } catch {
            print("DEBUG: Registration failed: \(error.localizedDescription)")
        }
    }
}
