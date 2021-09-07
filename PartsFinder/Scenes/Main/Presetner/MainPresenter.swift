//
//  MainPresenter.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

import Foundation

/// A type that presents scene-dependent content for main scene
protocol MainPresenterInputProtocol: AnyObject {

	/// ViewController that handles the UI
	var viewController: MainViewControllerInputProtocol? { get set }

	/// Presents the splitted result
	/// - Parameter splitted: Split result to be presented
	func present(_ splitted: SplitResult)
}

/// Implements main scene presentation logic
final class MainPresenter: MainPresenterInputProtocol {

	// MARK: - Properties

	/// ViewController
	weak var viewController: MainViewControllerInputProtocol?

	// MARK: - Methods

	/// Protocol imp
	func present(_ splitted: SplitResult) {
		viewController?.displayResult(splitted)
	}
}
