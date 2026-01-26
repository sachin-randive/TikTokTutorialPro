//
//  ContentView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 19/01/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel(authService: AuthService())
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
