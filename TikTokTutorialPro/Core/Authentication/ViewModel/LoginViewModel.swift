//
//  LoginViewModel.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 25/01/26.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    private let authService: AuthService
    
    init (authService: AuthService) {
        self.authService = authService
    }
    func login(email: String, password: String) async {
        do {
            try await authService.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Login failed: \(error.localizedDescription)")
        }
    }
}
