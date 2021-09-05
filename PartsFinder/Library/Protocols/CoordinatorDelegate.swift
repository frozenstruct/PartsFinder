//
//  CoordinatorDelegate.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import Foundation

protocol AppCoordinatorDelegate: AnyObject {

	var delegate: MainCoordinator? { get set }
}
