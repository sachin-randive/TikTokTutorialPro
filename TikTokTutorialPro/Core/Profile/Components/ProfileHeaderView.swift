//
//  ProfileHeaderView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 20/01/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    let user: User
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                //profile image
                AsyncImage(url: URL(string: user.profileImageUrl!)) {  image in
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .scaledToFill()
                        .clipShape(.rect(cornerRadius: 20))
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(Color(.systemGray5))
                }
                
                // user name
                Text("@\(user.username)")
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
            
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}


