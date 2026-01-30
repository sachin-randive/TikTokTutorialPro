//
//  Constants.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 30/01/26.
//

import FirebaseFirestore

struct FirestoreConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection =  Root.collection("users")
}
