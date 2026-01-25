//
//  AuthService.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 25/01/26.
//

import Foundation
import Firebase

class AuthService {
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email: \(email)")
    }
    
    func createUser(withEmail email: String,
                  password: String,
                  username: String,
                  fullname: String) async throws {
        print("DEBUG: User Indformation: \(username), \(fullname) : \(email)")
        
    }
    
    func signout() {
        
    }
    
}
