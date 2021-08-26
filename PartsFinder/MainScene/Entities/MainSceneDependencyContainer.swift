//
//  MainSceneDependencyContainer.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

/// Describes the set dependencies, suitable for injection
protocol MainSceneDependencyProtocol {

	/// Works with numbers
	var numbersWorker: NumbersWorkerProtocol { get }
}

/// Dependency container suitable for injection
struct MainSceneDependencyContainer: MainSceneDependencyProtocol {
	
	var numbersWorker: NumbersWorkerProtocol
}
