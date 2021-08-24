//
//  MainInteractor.swift
//  PartsFinder
//
//  Created by 19268356 on 23.08.2021.
//

import Foundation

protocol MainInteractorInputProtocol {

	var presenter: MainPresenterInputProtocol? { get set }
}

final class MainInteractor: MainInteractorInputProtocol {

	var presenter: MainPresenterInputProtocol?

}
