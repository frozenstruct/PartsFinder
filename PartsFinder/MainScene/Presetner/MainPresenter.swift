//
//  MainPresenter.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import Foundation

protocol MainPresenterInputProtocol: AnyObject {
	
	var viewController: MainViewControllerInputProtocol? { get set }
	
	func displayResult(_ num: SplitResultEntity)
}

final class MainPresenter: MainPresenterInputProtocol {
	
	// MARK: - Properties
	
	weak var viewController: MainViewControllerInputProtocol?
	
	// MARK: - Methods
	
	func displayResult(_ num: SplitResultEntity) {
		viewController?.displayResult(num)
	}
}
