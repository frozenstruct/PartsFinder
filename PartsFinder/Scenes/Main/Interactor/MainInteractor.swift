//
//  MainInteractor.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import Foundation

protocol MainInteractorInputProtocol: AnyObject {

	var presenter: MainPresenterInputProtocol? { get set }

	func split(_ number: Double)
}

final class MainInteractor: MainInteractorInputProtocol {

	// MARK: - Properties

	var presenter: MainPresenterInputProtocol?

	var decimalSplitter: NumberSplitterProtocol

	// MARK: - Initialization

	init(decimalSplitter: NumberSplitterProtocol) {
		self.decimalSplitter = decimalSplitter
	}

	// MARK: - Methods

	func split(_ number: Double) {
		presenter?.present(decimalSplitter.split(number))
	}
}
