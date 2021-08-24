//
//  MainSceneAssembler.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import UIKit

final class MainSceneAssembler {

	// MARK: - Properties

	var viewController: MainViewControllerInputProtocol
	var interactor: MainInteractorInputProtocol
	var presenter: MainPresenterInputProtocol

	// MARK: - Initialization

	init(
		_ view: MainViewControllerInputProtocol,
		_ interactor: MainInteractorInputProtocol,
		_ presenter: MainPresenterInputProtocol
	) {
		self.viewController = view
		self.interactor = interactor
		self.presenter = presenter
	}

	// MARK: - Methods

	func make() -> MainViewControllerInputProtocol {
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		return viewController
	}
}
