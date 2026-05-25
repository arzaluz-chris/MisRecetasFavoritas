//
//  AppDelegate.swift
//  MisRecetasFavoritas
//
//  Created by Christian Arzaluz on 25/05/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureNavigationBarAppearance()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Global Appearance

    private func configureNavigationBarAppearance() {
        let terracotta = UIColor(red: 0.757, green: 0.267, blue: 0.055, alpha: 1.0)
        let warmCream = UIColor(red: 1.0, green: 0.973, blue: 0.941, alpha: 1.0)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = warmCream
        appearance.shadowColor = .clear

        appearance.titleTextAttributes = [
            .foregroundColor: terracotta,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: terracotta,
            .font: UIFont.systemFont(ofSize: 34, weight: .heavy)
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = terracotta
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}
