//
//  AuthService.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 25/01/26.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email: \(email)")
    }
    
    func createUser(withEmail email: String,
                  password: String,
                  username: String,
                  fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: User created with uid: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to craete user: with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout() {
        
    }
    
}
