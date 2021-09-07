//
//  MainSceneDependencyContainer.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

/// A type that holds all dependencies needed for main scene
protocol MainSceneDependencyProtocol {

	/// Worker to split numbers
	var numberSplitter: NumberSplitterLogic { get }
}

/// Protocol imp
struct MainSceneDependencyContainer: MainSceneDependencyProtocol {

	var numberSplitter: NumberSplitterLogic
}
