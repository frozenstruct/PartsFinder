//
//  DSGradient.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 12.09.2021.
//

import UIKit

enum DSNGradient {

	private static var gradient = CAGradientLayer()

	/// Returns the preconfigured copy of the gradient
	public static var instance: CAGradientLayer {
		gradient
	}

	static func color(_ color: DSNColor) -> DSNGradient.Type {
		switch color {
		case .black:
			gradient.colors = [
				#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
				#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
			]

		case .green:
			gradient.colors = [
				#colorLiteral(red: 0.3173888028, green: 0.7608219981, blue: 0.4352326393, alpha: 1).cgColor,
				#colorLiteral(red: 0.9489449859, green: 0.9137673974, blue: 0.004057167098, alpha: 1).cgColor
			]

		case .white:
			gradient.colors = [
				#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
				#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).cgColor
			]
		}

		return self
	}

	static func locations(_ points: NSNumber) -> DSNGradient.Type {
		return self
	}

	static func endPoint(_ points: NSNumber) -> DSNGradient.Type {
		return self
	}

	static func startPoint(_ points: NSNumber) -> DSNGradient.Type {
		return self
	}

	static func onView(_ view: UIView) {
		gradient.frame = view.bounds
		view.layer.insertSublayer(gradient, at: 0)
	}
}
