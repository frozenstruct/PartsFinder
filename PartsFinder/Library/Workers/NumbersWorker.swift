//
//  DecimalSplitter.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import Foundation

/// Interface for object to work with numbers
/// - Note (features required):
///  - split numbers
///  - round numbers
///  - numbers should be doubles
///  - precision calculations should be in place
protocol NumbersWorkerProtocol {

	/// Splits the input number in two parts that in sum result in initial number
	/// - Parameter number: Some double
	/// - Returns: Tuple, containing the splitted numbers, rounded to 2 decimal places
	func split(_ number: Double) -> SplitResultEntity

	/// Rounds the input by 2 decimal places
	/// - Parameter number: Tuple, containing splitted numbers
	/// - Returns: Rounded numbers, ready to be presented
	func round(_ number: SplitResultEntity, with precision: Int16) -> SplitResultEntity
}

/// Performs splitting computations on numbers
final class NumbersWorker: NumbersWorkerProtocol {

	func split(_ input: Double) -> SplitResultEntity {
		let randomUpperBound = Double.random(in: 0.4...0.5)
		let random = Double.random(in: 0...Double(input) * randomUpperBound)

		let part0 = NSDecimalNumber(value: random)
		let part1 = NSDecimalNumber(value: input - random)

		return round((part0, part1))
	}

	func round(_ input: SplitResultEntity, with precision: Int16 = 2) -> SplitResultEntity {
		let roundingBehavior = NSDecimalNumberHandler(
			roundingMode: .plain,
			scale: precision,
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
