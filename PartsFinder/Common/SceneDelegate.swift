//
//  SceneDelegate.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	// MARK: - Properties

	var window: UIWindow?

	// MARK: - Scene Lifecycle

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else {
			return
		}

		let window = UIWindow(windowScene: windowScene)
		let context = CoordinatorContext.make()
		Coordinator.shared.setup(with: context)
		let viewController = Coordinator.shared.start()

		window.rootViewController = viewController
		window.makeKeyAndVisible()

		self.window = window
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}
}
