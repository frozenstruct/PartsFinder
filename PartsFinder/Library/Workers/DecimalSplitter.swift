//
//  DecimalSplitter.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import Foundation

protocol DecimalSplitterProtocol {
	
	func split(_ input: Double) -> (part0: NSDecimalNumber, part1: NSDecimalNumber)
}

final class DecimalSplitter: DecimalSplitterProtocol {
	
	func split(_ input: Double) -> (part0: NSDecimalNumber, part1: NSDecimalNumber) {
		let randomUpperBound = Double.random(in: 0.4...0.5)
		let random = Double.random(in: 0...Double(input) * randomUpperBound)

		let part0 = NSDecimalNumber(value: random)
		let part1 = NSDecimalNumber(value: input - random)

		return roundTwoPlaces((part0, part1))
	}

	func roundTwoPlaces(_ input: SplitResultEntity) -> SplitResultEntity {
		let roundingBehavior = NSDecimalNumberHandler(
			roundingMode: .plain,
			scale: 2,
			raiseOnExactness: false,
			raiseOnOverflow: false,
			raiseOnUnderflow: false,
			raiseOnDivideByZero: false
		)

		return (
			input.part0.rounding(accordingToBehavior: roundingBehavior),
			input.part1.rounding(accordingToBehavior: roundingBehavior)
		)
	}
}
