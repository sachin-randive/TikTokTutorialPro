//
//  TikTokTutorialProApp.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 19/01/26.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TikTokTutorialProApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let authService = AuthService()
    private let userService = UserService()

    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService, userService: userService)
        }
    }
}
