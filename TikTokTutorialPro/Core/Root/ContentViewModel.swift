//
//  ContentViewModel.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 25/01/26.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService) {
        self.authService = authService
        setupSubscribers()
        authService.updateUserSession()
    }
    
    private func setupSubscribers() {
        authService.$userSession
            .sink(receiveValue: { [weak self] user in
                self?.userSession = user
            })
            .store(in: &cancellables)
    }
}
