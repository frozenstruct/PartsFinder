//
//  DecimalSplitter.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import Foundation

protocol DecimalSplitterProtocol {

	func divideIntoParts(_ input: Double) -> (Double, Double)
}

final class DecimalSplitter: DecimalSplitterProtocol {

	func divideIntoParts(_ input: Double) -> (Double, Double) {
		let randomUpperBound = Double.random(in: 0.4...0.5)
		let random = Double.random(in: 0...Double(input) * randomUpperBound)

		return (random, input - random)
	}
}
