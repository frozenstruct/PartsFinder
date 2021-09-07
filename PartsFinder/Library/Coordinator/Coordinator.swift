//
//  Coordinator.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

/// Implements application coordinator base logic
/// Global routing throughout the app is provided here
final class Coordinator: ApplicationCoordinatorLogic {

	// MARK: - Subtypes

	/// Possible routable scenes
	enum EndpointKind: String {
		case main
	}

	// MARK: - Properties

	/// Singleton imp
	static var shared = Coordinator()

	/// Assemblers container dependency
	var assemblers: AssemblersContainer?

	/// Navigation controller that handles the transition between scenes
	var navigationController: UINavigationController?

	// MARK: - Initialization

	/// Singletion imp
	private init() { }

	// MARK: - Methods

	/// Sets up the context for coordinating
	/// - Parameter context: Assemblers & navigationController that coordinator expects to work
	func setup(with context: AppCoordinatorContext) {
		assemblers = context.assemblers
		navigationController = context.navigationController
	}

	/// Starts the initial scene
	func start() -> UIViewController {
		guard let viewController = assemblers?.initialSceneAssembler.make(),
			  let navigationController = navigationController else {
			return UIViewController()
		}
		navigationController.setViewControllers(
			[viewController],
			animated: UIView.areAnimationsEnabled
		)
		navigationController.setNavigationBarHidden(
			true,
			animated: false
		)
		return navigationController
	}

	/// Routing imp
	func route(to endpoint: EndpointKind) {
		let viewController = makeDestination(from: endpoint)
		navigationController?.pushViewController(
			viewController,
			animated: UIView.areAnimationsEnabled
		)
	}

	/// Creates a scene and returns its initial viewController
	/// - Parameter endpoint: Scene which user will be routed to
	private func makeDestination(from endpoint: EndpointKind) -> UIViewController {
		switch endpoint {
		case .main:
			let viewController = MainSceneAssembler(
				MainSceneDependencyContainer(
					numberSplitter: NumberSplitter()
				)
			).make()

			return viewController
		}
	}
}
