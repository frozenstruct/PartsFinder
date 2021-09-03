//
//  Double+NSDecimalNumber.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 03.09.2021.
//

import Foundation

extension Double {

	/// Shorthand for type-casting: used when it's needed to convert `Double` to `NSDecimalNumber`
	var decimalNumber: NSDecimalNumber {
		return NSDecimalNumber(value: self)
	}
}
