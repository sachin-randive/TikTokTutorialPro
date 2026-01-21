//
//  ProfileHeaderView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 20/01/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                //profile image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                
                // user name
                Text("@lewes.helimon")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
            }
            // stats view
            HStack(spacing: 16) {
                
                UserStatView(value: 5, title: "Following")
                
                UserStatView(value: 1, title: "Followers")
                
                UserStatView(value: 7, title: "Likes")
            }
            // Action button
        }
    }
}

#Preview {
    ProfileHeaderView()
}


