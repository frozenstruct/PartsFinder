//
//  SplashSceneAssembler.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

/// Assembles the scene with the splash screen
final class SplashSceneAssembler: AssemblyLogic {

	/// Make function imp
	func make() -> UIViewController {
		let context = SplashSceneViewContext(
			gradient: DSNGradient.color(.green).instance
		)
		let viewController = SplashScreenViewController(context: context)
		return viewController
	}
}
