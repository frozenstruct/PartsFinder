//
//  AssemblyLogic.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

/// A type that is able to configure the scene and return the initial scene viewController
protocol AssemblyLogic: AnyObject {

	/// Configures the initial viewController of the scene
	/// - Returns: Scene initial viewController
	func make() -> UIViewController
}
