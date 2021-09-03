//
//  MainSceneDependencyContainer.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

protocol MainSceneDependencyProtocol {

	var decimalSplitterWorker: NumberSplitterProtocol { get }
}

struct MainSceneDependencyContainer: MainSceneDependencyProtocol {

	var decimalSplitterWorker: NumberSplitterProtocol
}
