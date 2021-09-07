//
//  DecimalSplitter.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 24.08.2021.
//

import Foundation

/// A type that is able to intake a number, split it into two random parts and return as a tuple
protocol NumberSplitterLogic {

	/// Splits the input number into two unequal parts and returns them as a tuple
	/// - Returns: Split result tuple
	func split(_ number: Double) -> SplitResult

	/// Generates two random numbers from the input number, which are the terms of the input number
	/// - Returns: Random parts tuple
	func getRandomParts(from number: Double) -> SplitResult

	/// Rounds the numbers in the input tuple to the specified number of decimal places
	/// - Returns: Rounded numbers tuple
	func round(_ numbers: SplitResult, to places: Int16) -> SplitResult
}

/// A type that implements `NumberSplitterLogic` protocol
final class NumberSplitter: NumberSplitterLogic {

	/// Splitting imp
	func split(_ number: Double) -> SplitResult {
		let randomNumberParts = getRandomParts(from: number)

		return round(
			(
				randomNumberParts.part0,
				randomNumberParts.part1
			)
		)
	}

	/// Randoming imp
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

	/// Rounding imp
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
