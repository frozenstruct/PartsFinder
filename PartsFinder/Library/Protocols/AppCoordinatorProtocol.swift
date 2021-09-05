//
//  AppCoordinatorProtocol.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

protocol AppCoordinatorProtocol {

	var navigationController: UINavigationController { get set }

	var assemblers: AssemblersContainer { get set }

	func start() -> UIViewController
}
