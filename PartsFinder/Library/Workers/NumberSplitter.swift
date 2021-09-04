//
//  DecimalSplitter.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

import Foundation

protocol NumberSplitterProtocol {

	func split(_ number: Double) -> SplitResult

	func getRandomParts(from number: Double) -> SplitResult

	func round(_ numbers: SplitResult, to places: Int16) -> SplitResult
}

final class NumberSplitter: NumberSplitterProtocol {

	func split(_ number: Double) -> SplitResult {
		let randomNumberParts = getRandomParts(from: number)

		return round(
			(
				randomNumberParts.part0,
				randomNumberParts.part1
			)
		)
	}

	func getRandomParts(from number: Double) -> SplitResult {
		let randomUpperBound = Double.random(in: 0.4...0.5)
		let maxRandomPart = Double(number) * randomUpperBound

		let randomNumberPart0 = Double.random(in: 0...maxRandomPart)
		let randomNumberPart1 = number - randomNumberPart0

		return (
			randomNumberPart0.decimalNumber,
			randomNumberPart1.decimalNumber
		)
	}

	func round(_ numbers: SplitResult, to places: Int16 = 2) -> SplitResult {
		let roundingBehavior = NSDecimalNumberHandler(
			roundingMode: .plain,
			scale: places,
			raiseOnExactness: false,
			raiseOnOverflow: false,
			raiseOnUnderflow: false,
			raiseOnDivideByZero: false
		)

		return (
			numbers.part0.rounding(accordingToBehavior: roundingBehavior),
			numbers.part1.rounding(accordingToBehavior: roundingBehavior)
		)
	}
}
