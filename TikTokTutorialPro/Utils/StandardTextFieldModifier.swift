//
//  StandardTextFieldModifier.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 23/01/26.
//

import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    @Environment(\.isEnabled) var isEnabled
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
