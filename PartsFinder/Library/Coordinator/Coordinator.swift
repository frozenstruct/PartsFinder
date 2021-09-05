//
//  Coordinator.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

protocol AppCoordinatorProtocol {

	var navigationController: UINavigationController? { get set }

	var assemblers: AssemblersContainer? { get set }

	func start() -> UIViewController
}

final class Coordinator: AppCoordinatorProtocol {

	enum EndpointKind: String {
		case main
	}

	static var shared = Coordinator()

	var assemblers: AssemblersContainer?
	var navigationController: UINavigationController?

	private init() { }

	func setup(with context: AppCoordinatorContext) {
		assemblers = context.assemblers
		navigationController = context.navigationController
	}

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

	func route(to endpoint: EndpointKind) {
		let viewController = makeDestination(from: endpoint)
		navigationController?.pushViewController(
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
