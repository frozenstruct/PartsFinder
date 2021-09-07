//
//  ApplicationCoordinatorLogic.swift
//  PartsFinder
//
//  Created by 19268356 on 06.09.2021.
//

import UIKit

/// A type that supports basic coordination within the app's flows
protocol ApplicationCoordinatorLogic {

	/// Possible endpoints variety as	 an enumeration
	associatedtype EndpointKind: RawRepresentable

	/// `UINavigationController` instance handles `push` / `pop` operations
	var navigationController: UINavigationController? { get set }

	/// Assemblers of all scenes neede to be routed from to
	var assemblers: AssemblersContainer? { get set }

	/// Presents the initial app scene
	/// - Returns: ViewController of the initial scene
	func start() -> UIViewController

	/// Routes user to the specified endpoint
	/// - Parameter endpoint: Scene which user will be routed to
	func route(to endpoint: EndpointKind)
}
