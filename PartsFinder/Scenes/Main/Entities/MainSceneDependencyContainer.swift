//
//  MainSceneDependencyContainer.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

protocol MainSceneDependencyProtocol {

	var numberSplitter: NumberSplitterProtocol { get }
}

struct MainSceneDependencyContainer: MainSceneDependencyProtocol {

	var numberSplitter: NumberSplitterProtocol
}
