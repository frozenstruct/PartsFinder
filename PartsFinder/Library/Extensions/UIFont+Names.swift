//
//  UIFont+Names.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

extension UIFont {

	func getFontsNames() {
		for family: String in UIFont.familyNames {
			print(family)
			for names: String in UIFont.fontNames(forFamilyName: family) {
				print("== \(names)")
			}
		}
	}
}
