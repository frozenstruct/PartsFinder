//
//  MainPresenter.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import Foundation

protocol MainPresenterInputProtocol {

	var viewController: MainViewControllerInputProtocol? { get set }
}

final class MainPresenter: MainPresenterInputProtocol {

	// MARK: - Properties

	var viewController: MainViewControllerInputProtocol?

	// MARK: - Initialization

	init(<#parameters#>) {
		<#statements#>
	}

	// MARK: - Methods
}
