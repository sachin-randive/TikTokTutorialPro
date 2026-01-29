//
//  AuthService.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 25/01/26.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthService {
    @Published var userSession: FirebaseAuth.User?
    private let userService = UserService()
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User is: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to login in with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                  password: String,
                  username: String,
                  fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
           // print("DEBUG: User created with uid: \(result.user.uid)")
            try await uploadUserData(withEmail: email,
                                     id: result.user.uid,
                                     username: username,
                                     fullname: fullname)
        } catch {
            print("DEBUG: Failed to craete user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout() {
        try? Auth.auth().signOut() // signs user out on backend
        self.userSession = nil // updates routing logic by wiping user session
        
    }
    
    private func uploadUserData(withEmail email: String,
                                id: String,
                                username: String,
                                fullname: String) async throws {
        let user = User(id: id, username: username, email: email, fullname: fullname, profileImageUrl: "", bio: "")
        try await userService.uploadUserData(user)
    }
}
