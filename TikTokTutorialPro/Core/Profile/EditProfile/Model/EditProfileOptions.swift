//
//  EditProfileOption.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 31/01/26.
//

import Foundation

enum EditProfileOptions: Hashable {
    case name
    case username
    case bio
    
    var title: String {
        switch self {
        case .name:
            return "Name"
        case .username:
            return "Username"
        case .bio:
            return "Bio"
        }
    }
}
