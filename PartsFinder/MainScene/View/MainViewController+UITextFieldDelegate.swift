//
//  MainViewController+UITextFieldDelegate.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 04.09.2021.
//

import UIKit

// MARK: - UITextFieldDelegate Conformance

extension MainViewController: UITextFieldDelegate {

	func textField(
		_ textField: UITextField,
		shouldChangeCharactersIn range: NSRange,
		replacementString string: String
	) -> Bool {
		let stringInput = NSString(
			string: textField.text ?? ""
		).replacingCharacters(
			in: range,
			with: string
		)

		guard !stringInput.isEmpty
		else { return true }

		return NumberFormatter().number(from: stringInput)?.intValue != nil
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		split()

		return true
	}
}
