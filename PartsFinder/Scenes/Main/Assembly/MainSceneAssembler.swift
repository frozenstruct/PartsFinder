//
//  MainSceneAssembler.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

import UIKit

/// Assembles the Scene
final class MainSceneAssembler: AssemblyLogic {

	// MARK: - Properties

	private var dependencies: MainSceneDependencyContainer

	// MARK: - Initialization

	/// Instantiates the copy of the assembler
	/// - Parameter dependencies: All dependencies that are to be injected
	init(
		_ dependencies: MainSceneDependencyContainer
	) {
		self.dependencies = dependencies
	}

	// MARK: - Methods

	/// Instantiates the main view controller and returns it
	func make() -> UIViewController {
		let viewController = MainViewController()
		let interactor = MainInteractor(
			decimalSplitter: dependencies.numberSplitter
		)
		let presenter = MainPresenter()

		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		return viewController
	}
}
