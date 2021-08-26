//
//  MainPresenter.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import Foundation

/// Descibes the minimum required logic for presenter
protocol MainPresenterInputProtocol: AnyObject {
	
	/// Sends the splitted result to the view
	/// - Parameter result: Tuple that contains splitted numbers
	func displayResult(_ result: SplitResultEntity)
}

/// Presenter implementation to pass data to the view
final class MainPresenter: MainPresenterInputProtocol {
	
	// MARK: - Properties
	
	weak var viewController: MainViewControllerInputProtocol?
	
	// MARK: - Methods
	
	func displayResult(_ num: SplitResultEntity) {
		viewController?.displayResult(num)
	}
}
