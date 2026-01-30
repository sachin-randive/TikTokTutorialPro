//
//  CurrentUserProfileView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 20/01/26.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let authservice: AuthService
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // profile header
                    ProfileHeaderView(user: DeveloperPreview.user)
                    
                    // post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationBarTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Sign Out") {
                        authservice.signout()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authservice: AuthService())
}
