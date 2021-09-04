//
//  UIView+SafeAnchors.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

extension UIView {

	var hasBottomInsets: Bool {
		if #available(iOS 11.0, *) {
			return safeAreaInsets.bottom > 0
		} else {
			return false
		}
	}

	var safeTopAnchor: NSLayoutYAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.topAnchor
		} else {
			return topAnchor
		}
	}

	var safeBottomAnchor: NSLayoutYAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.bottomAnchor
		} else {
			return bottomAnchor
		}
	}

	var safeLeadingAnchor: NSLayoutXAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.leadingAnchor
		} else {
			return leadingAnchor
		}
	}

	var safeTrailingAnchor: NSLayoutXAxisAnchor {
		if #available(iOS 11.0, *) {
			return safeAreaLayoutGuide.trailingAnchor
		} else {
			return trailingAnchor
		}
	}
}
