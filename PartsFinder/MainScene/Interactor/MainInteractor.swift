//
//  MainInteractor.swift
//  PartsFinder
//
//  Created by 19268356 on 23.08.2021.
//

import Foundation

/// Describes the basic behaviour required for interactor
protocol MainInteractorInputProtocol: AnyObject {

	/// Splits the number in two parts
	/// - Parameter num: Some arbitrary number to split
	func split(_ num: Double)
}

/// Main Scene Interactor - does all the business for the scene
final class MainInteractor: MainInteractorInputProtocol {
	
	// MARK: - Properties

	/// Presenter as per VIP
	var presenter: MainPresenterInputProtocol?

	/// Worker that splits numbers
	var decimalSplitter: NumbersWorkerProtocol
	
	// MARK: - Initialization

	/// Instantiates the copy of the interactor
	/// - Parameter decimalSplitter: Number worker
	init(decimalSplitter: NumbersWorkerProtocol) {
		self.decimalSplitter = decimalSplitter
	}
	
	// MARK: - Methods
	
	func split(_ num: Double) {
		presenter?.displayResult(decimalSplitter.split(num))
	}
	
}
