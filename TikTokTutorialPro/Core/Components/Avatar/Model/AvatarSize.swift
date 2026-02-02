//
//  AvatarSize.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 02/02/26.
//

import Foundation

enum AvatarSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimention: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}
