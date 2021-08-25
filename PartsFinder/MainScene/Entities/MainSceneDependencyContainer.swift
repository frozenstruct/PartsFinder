//
//  MainSceneDependencyContainer.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

protocol MainSceneDependencyProtocol {
	
	var decimalSplitterWorker: DecimalSplitterProtocol { get }
}

struct MainSceneDependencyContainer: MainSceneDependencyProtocol {
	
	var decimalSplitterWorker: DecimalSplitterProtocol
}
