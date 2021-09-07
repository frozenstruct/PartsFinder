//
//  MainInteractor.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import Foundation

/// A type that implements the business logic of the maiun scene
protocol MainInteractorInputProtocol: AnyObject {

	/// Interactor
	var presenter: MainPresenterInputProtocol? { get set }

	/// Splits the number in two unequal parts that are the terms of the input number
	/// - Parameter number: Double precision number to be sent to splitting
	func split(_ number: Double)
}

/// Implements main scene business logic
final class MainInteractor: MainInteractorInputProtocol {

	// MARK: - Properties

	/// Presenter
	var presenter: MainPresenterInputProtocol?

	/// Numbers worker
	var numberSplitter: NumberSplitterLogic

	// MARK: - Initialization

	/// Instantiates the working copy of Interactor
	/// - Parameter decimalSplitter: Worker to split numbers
	init(decimalSplitter: NumberSplitterLogic) {
		self.numberSplitter = decimalSplitter
	}

	// MARK: - Methods

	/// Splits number as per protocol
	func split(_ number: Double) {
		presenter?.present(numberSplitter.split(number))
	}
}
