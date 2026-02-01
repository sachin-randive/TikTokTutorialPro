//
//  EditProfileManager.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 01/02/26.
//

import UIKit
import FirebaseAuth

class EditProfileManager: ObservableObject {
    private let imageUploader: ImageUploader
    
    init(imageUploader: ImageUploader) {
        self.imageUploader = imageUploader
    }
    
    func uploadProfileImage(_ uiImgae: UIImage) async {
        do {
            let profileImageUrl = try await ImageUploader().uploadImage(image: uiImgae)
            try await updateUserProfileImageUrl(profileImageUrl)
        } catch {
            print("DEBUG: Handle image upload error here..")
        }
    }
    
    private func updateUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        
        try await FirestoreConstants.UsersCollection.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
    }
}
