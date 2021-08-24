//
//  MainInteractor.swift
//  PartsFinder
//
//  Created by 19268356 on 23.08.2021.
//

import Foundation

protocol MainInteractorInputProtocol: AnyObject {

	var presenter: MainPresenterInputProtocol? { get set }
}

final class MainInteractor: MainInteractorInputProtocol {

	// MARK: - Properties

	var presenter: MainPresenterInputProtocol?

	var decimalSplitter: DecimalSplitterProtocol

	// MARK: - Initialization

	init(decimalSplitter: DecimalSplitterProtocol) {
		self.decimalSplitter = decimalSplitter
	}

	// MARK: - Methods

	func doSomething() {

	}

}
