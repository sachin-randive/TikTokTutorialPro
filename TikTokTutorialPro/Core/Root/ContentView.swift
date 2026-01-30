//
//  ContentView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 19/01/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ContentViewModel
    private let auhtService: AuthService
    private let userService: UserService
    
    init(authService: AuthService, userService: UserService) {
        self.auhtService = authService
        self.userService = userService
        let vm = ContentViewModel(authService: authService, userService: userService)
        self._viewModel = .init(wrappedValue: vm)
    }
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                if let user = viewModel.currentUser {
                    MainTabView(authservice: auhtService, user: user)
                }
            } else {
                LoginView(authService: auhtService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService(), userService: UserService())
}
