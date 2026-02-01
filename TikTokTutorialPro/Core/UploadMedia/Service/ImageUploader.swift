//
//  ImageUploader.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 01/02/26.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: failed to uploading image: \(error.localizedDescription)")
            return nil
        }
    }
}
