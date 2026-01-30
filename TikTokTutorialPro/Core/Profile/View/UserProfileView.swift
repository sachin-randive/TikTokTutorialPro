//
//  UserProfileView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 30/01/26.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack {
                // profile header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
