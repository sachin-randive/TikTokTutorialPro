//
//  PreviewProvider.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 29/01/26.
//

import Foundation

struct DeveloperPreview {
    static var user = User(
        id: "1234567890",
        username: "sachinrandive",
        email: "sachin@example.com",
        fullname: "Sachin Randive",
        profileImageUrl: "https://i.pravatar.cc/150?img=7",
        bio: "Hello, world!")
    
    static var users: [User] = [
        .init(id: "1", username: "user1", email: "user1@example.com", fullname: "User 1 full name", profileImageUrl: "https://example.com/profile1.jpg", bio: ""),
        .init(id: "2", username: "user2", email: "user2@example.com", fullname: "User 2 full name", profileImageUrl: "https://example.com/profile2.jpg", bio: ""),
        .init(id: "3", username: "user3", email: "user3@example.com", fullname: "User 3 full name", profileImageUrl: "https://example.com/profile3.jpg", bio: ""),
        .init(id: "4", username: "user4", email: "user4@example.com", fullname: "User 4 full name", profileImageUrl: "https://example.com/profile4.jpg", bio: ""),
        
    ]
}
