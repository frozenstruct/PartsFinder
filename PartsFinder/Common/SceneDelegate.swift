//
//  SceneDelegate.swift
//  PartsFinder
//
//  Created by 19268356 on 23.08.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	// MARK: - Properties
	
	var window: UIWindow?
	
	// MARK: - Scene Lifecycle

	/// Main (root) scene is configured here
	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let window = UIWindow(windowScene: windowScene)
		let viewController = MainSceneAssembler(
			MainSceneDependencyContainer(
				numbersWorker: NumbersWorker()
			)
		).make()
		
		window.rootViewController = viewController
		window.makeKeyAndVisible()
		
		self.window = window
	}
}
