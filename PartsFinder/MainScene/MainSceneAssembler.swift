//
//  MainSceneAssembler.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import UIKit

final class MainSceneAssembler {

	// MARK: - Properties

	private var viewController: MainViewControllerInputProtocol
	private var interactor: MainInteractorInputProtocol
	private var presenter: MainPresenterInputProtocol

	private var dependencies: MainSceneDependencyContainer

	// MARK: - Initialization

	init(
		_ view: MainViewControllerInputProtocol,
		_ interactor: MainInteractorInputProtocol,
		_ presenter: MainPresenterInputProtocol,
		_ dependencies: MainSceneDependencyContainer
	) {
		self.viewController = view
		self.interactor = interactor
		self.presenter = presenter
		self.dependencies = dependencies
	}

	// MARK: - Methods

	func make() -> MainViewControllerInputProtocol {
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		return viewController
	}
}
