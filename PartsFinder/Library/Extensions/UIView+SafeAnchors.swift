//
//  UIView+SafeAnchors.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

extension UIView {

	/// Marks whether the view has bottom insets or not
	var hasBottomInsets: Bool {
		if #available(iOS 11.0, *) {
			return safeAreaInsets.bottom > 0
		} else {
			return false
		}
	}

	/// Conditionally returns view's top anchor plus safe area inset
	/// - Important: Avaliable only on iOS 11 and further (on lower versions non-safe anchor is returned)
	var safeTopAnchor: NSLayoutYAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.topAnchor
		} else {
			return topAnchor
		}
	}

	/// Conditionally returns view's bottom anchor plus safe area inset
	/// - Important: Avaliable only on iOS 11 and further (on lower versions non-safe anchor is returned)
	var safeBottomAnchor: NSLayoutYAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.bottomAnchor
		} else {
			return bottomAnchor
		}
	}

	/// Conditionally returns view's leading anchor plus safe area inset
	/// - Important: Avaliable only on iOS 11 and further (on lower versions non-safe anchor is returned)
	var safeLeadingAnchor: NSLayoutXAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.leadingAnchor
		} else {
			return leadingAnchor
		}
	}

	/// Conditionally returns view's trailing anchor plus safe area inset
	/// - Important: Avaliable only on iOS 11 and further (on lower versions non-safe anchor is returned)
	var safeTrailingAnchor: NSLayoutXAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.trailingAnchor
		} else {
			return trailingAnchor
		}
	}
}
