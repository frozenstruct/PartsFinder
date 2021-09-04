//
//  MainPresenter.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

import Foundation

protocol MainPresenterInputProtocol: AnyObject {

	var viewController: MainViewControllerInputProtocol? { get set }

	func present(_ splitted: SplitResult)
}

final class MainPresenter: MainPresenterInputProtocol {

	// MARK: - Properties

	weak var viewController: MainViewControllerInputProtocol?

	// MARK: - Methods

	func present(_ splitted: SplitResult) {
		viewController?.displayResult(splitted)
	}
}
