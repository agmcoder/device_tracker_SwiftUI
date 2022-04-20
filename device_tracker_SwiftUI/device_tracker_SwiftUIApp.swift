//
//  device_tracker_SwiftUIApp.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 12/4/22.
//
//

import SwiftUI
import Firebase
@main
struct device_tracker_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModelStatus = StatusSelectorViewModel()
    @StateObject var editProfileViewModel = EditProfileViewModel()
    var body: some Scene {
        WindowGroup {
            MainTabView()

        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
