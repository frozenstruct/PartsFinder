//
//  MainSceneAssembler.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

import UIKit

final class MainSceneAssembler {

	// MARK: - Properties

	private var dependencies: MainSceneDependencyContainer

	// MARK: - Initialization

	init(
		_ dependencies: MainSceneDependencyContainer
	) {
		self.dependencies = dependencies
	}

	// MARK: - Methods

	func make() -> UIViewController {
		let viewController = MainViewController()
		let interactor = MainInteractor(
			decimalSplitter: dependencies.decimalSplitterWorker
		)
		let presenter = MainPresenter()

		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		return viewController
	}
}
