//
//  SplashSceneAssembler.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

final class SplashSceneAssembler: AssemblyLogic {

	func make() -> UIViewController {
		let viewController = SplashScreenViewController()
		return viewController
	}
}
