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
    init(authService: AuthService) {
        self.auhtService = authService
        let vm = ContentViewModel(authService: authService)
        self._viewModel = .init(wrappedValue: vm)
    }
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView(authservice: auhtService)
            } else {
                LoginView(authService: auhtService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService())
}
