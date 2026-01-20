//
//  NotificationView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 20/01/26.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(0..<10) { notification in
                        NotificationCell()
                    }
                }
            }
            .navigationTitle(Text("Notifications"))
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    NotificationView()
}
