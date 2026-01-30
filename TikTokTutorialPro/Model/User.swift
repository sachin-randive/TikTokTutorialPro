//
//  User.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 29/01/26.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    let profileImageUrl: String?
    let bio: String?
}

extension User: Hashable { }
