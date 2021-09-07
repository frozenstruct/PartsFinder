//
//  AppContextMaker.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 07.09.2021.
//

import UIKit

enum CoordinatorContext {

	static func make() -> AppCoordinatorContext {
		let assemblers = AssemblersContainer(
			initialSceneAssembler: SplashSceneAssembler(),
			mainSceneAssembler: MainSceneAssembler(
				MainSceneDependencyContainer(
					numberSplitter: NumberSplitter()
				)
			)
		)

		let context = AppCoordinatorContext(
			assemblers: assemblers,
			navigationController: UINavigationController()
		)

		return context
	}
}
