//
//  Coordinator.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

final class MainCoordinator: AppCoordinatorProtocol {

	enum EndpointKind: String {
		case main
	}

	var assemblers: AssemblersContainer
	var navigationController: UINavigationController

	init(
		navigationController: UINavigationController,
		assemblers: AssemblersContainer
	) {
		self.navigationController = navigationController
		self.assemblers = assemblers
	}

	func start() -> UIViewController {
		let viewController = assemblers.initialSceneAssembler.make()
		navigationController.setViewControllers(
			[viewController],
			animated: UIView.areAnimationsEnabled
		)
		navigationController.setNavigationBarHidden(true, animated: false)
		return navigationController
	}

	func route(to endpoint: EndpointKind) {
		let viewController = makeDestination(from: endpoint)
		navigationController.pushViewController(
			viewController,
			animated: UIView.areAnimationsEnabled
		)
	}

	func makeDestination(from endpoint: EndpointKind) -> UIViewController {
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
