//
//  CoordinatorDependencyContainer.swift
//  PartsFinder
//
//  Created by 19268356 on 06.09.2021.
//

import UIKit

/// Convenience container made to swiftly pass-in the coordinator dependencies
struct AppCoordinatorContext {

	/// A container of app's assemblers
	let assemblers: AssemblersContainer

	/// `UINavigationController` instance handles `push` / `pop` operations
	let navigationController: UINavigationController
}
