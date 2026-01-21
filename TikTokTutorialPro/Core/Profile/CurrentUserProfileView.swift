//
//  CurrentUserProfileView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 20/01/26.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    // profile header
                    ProfileHeaderView()
                    // post grid view
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
