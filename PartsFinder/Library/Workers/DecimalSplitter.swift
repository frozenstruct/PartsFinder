//
//  DecimalSplitter.swift
//  PartsFinder
//
//  Created by 19268356 on 24.08.2021.
//

import Foundation

protocol DecimalSplitterProtocol {
	
	func split(_ input: Double) -> (part0: Double, part1: Double)
}

final class DecimalSplitter: DecimalSplitterProtocol {
	
	func split(_ input: Double) -> (part0: Double, part1: Double) {
		let randomUpperBound = Double.random(in: 0.4...0.5)
		let random = Double.random(in: 0...Double(input) * randomUpperBound)
		
		return (random, input - random)
	}
}
