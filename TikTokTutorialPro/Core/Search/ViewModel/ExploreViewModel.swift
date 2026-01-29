//
//  ExploreViewModel.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 29/01/26.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
        Task {await fetchUsers()}
    }
    
    func fetchUsers() async {
       // self.users = DeveloperPreview.users
        do {
            self.users = try await userService.fetchUsers()
        } catch {
            print("DEBUG: Failed to fetch user with error: \(error.localizedDescription)")
        }
    }
}
