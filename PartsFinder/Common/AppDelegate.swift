//
//  AppDelegate.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	// MARK: - Properties

	var window: UIWindow?

	// MARK: - App's Lifecycle

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(
		_ application: UIApplication,
		configurationForConnecting connectingSceneSession: UISceneSession,
		options: UIScene.ConnectionOptions
	) -> UISceneConfiguration {

		return UISceneConfiguration(
			name: "Default Configuration",
			sessionRole: connectingSceneSession.role
		)
	}

	func application(
		_ application: UIApplication,
		didDiscardSceneSessions sceneSessions: Set<UISceneSession>
	) {
	}

}
