//
//  UIFont+Names.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

extension UIFont {

	/// Allows to peek all fonts available for application
	/// - Note: Prodces output as a debug console log
	func getFontsNames() {
		for family: String in UIFont.familyNames {
			print(family)
			for names: String in UIFont.fontNames(forFamilyName: family) {
				print("== \(names)")
			}
		}
	}
}
