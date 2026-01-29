//
//  UserService.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 29/01/26.
//

import FirebaseAuth
import FirebaseFirestoreCombineSwift
import FirebaseFirestore

struct UserService {
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
            
        } catch {
            throw error
        }
    }
}

