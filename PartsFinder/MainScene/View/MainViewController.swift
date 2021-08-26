//
//  MainViewController.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

/// Describes base functionality of the ViewController, applicable for `VIP`
protocol MainViewControllerInputProtocol: AnyObject {

	/// Takes the splitted digits and sends it to the view
	/// - Parameter num: tuple, containing the splitted numbers
	func displayResult(_ num: SplitResultEntity)
}

/// Holds and manages the visual representation of the cycle data
class MainViewController: UIViewController, MainViewControllerInputProtocol {
	
	// MARK: - VIP
	
	var interactor: MainInteractorInputProtocol?
	
	// MARK: - Utility

	/// Holds some magic numbers to facilitate constraints
	struct DimensionalConstants {
		
		static var defaultButtonHeight: CGFloat = 30.0
		static var defaultButtonWidth: CGFloat = 75.0
	}
	
	// MARK: - UI Constituents
	
	/// Greeting Label at the top of the screen
	private lazy var greetingLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = "Random Split!"
		label.sizeToFit()
		return label
	}()
	
	/// Fancy background
	private lazy var backdropImageView: UIImageView = {
		let imageView = UIImageView(
			image: UIImage(
				named: "backdrop"
			)
		)
		imageView.contentMode = .scaleAspectFit
		imageView.alpha = 0.1
		
		return imageView
	}()
	
	/// Holds the textual title of the input text field
	private lazy var inputLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = "Put some numer here"
		label.sizeToFit()
		return label
	}()
	
	/// Text field that accepts the number user wants to divide
	private lazy var inputTextField: UITextField = {
		let field = UITextField(frame: .zero)
		field.borderStyle = .roundedRect
		field.delegate = self
		field.keyboardType = .numberPad
		field.placeholder = "Enter the number here"
		return field
	}()
	
	/// The main button, that triggers the splitting
	private lazy var processButton: UIButton = {
		let button = UIButton(type: .roundedRect)
		button.setTitle("SPLIT", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.titleLabel?.sizeToFit()
		button.addTarget(
			self,
			action: #selector(sendNumberForSplit),
			for: .touchUpInside
		)
		return button
	}()
	
	/// Holds the textual title of the output text field
	private lazy var outputLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = "Result will be here..."
		label.sizeToFit()
		return label
	}()
	
	
	// MARK: - View Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		addSubviews()
		constrainSubviews()
		
		view.backgroundColor = .white
	}
	
	// MARK: - UI Assembly
	
	func addSubviews() {
		[
			greetingLabel,
			backdropImageView,
			inputLabel,
			inputTextField,
			processButton,
			outputLabel
		].forEach({
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
		})
	}
	
	func constrainSubviews() {
		NSLayoutConstraint.activate([
			greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			greetingLabel.topAnchor.constraint(equalTo: view.safeTopAnchor)
		])
		
		NSLayoutConstraint.activate([
			backdropImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			backdropImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
		
		NSLayoutConstraint.activate([
			inputLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			inputLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 20)
		])
		
		NSLayoutConstraint.activate([
			inputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			inputTextField.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 20),
			inputTextField.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: 20),
			inputTextField.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -20),
		])
		
		NSLayoutConstraint.activate([
			processButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			processButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 40),
			processButton.heightAnchor.constraint(equalToConstant: DimensionalConstants.defaultButtonHeight)
		])
		
		NSLayoutConstraint.activate([
			outputLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			outputLabel.topAnchor.constraint(equalTo: processButton.bottomAnchor, constant: 40)
		])
	}
	
	// MARK: - Methods

	/// Selector for action button
	@objc func sendNumberForSplit() {
		guard let text = inputTextField.text,
			  let num = Double(text)
		else {
			return
		}
		
		interactor?.split(num)
	}

	func displayResult(_ num: SplitResultEntity) {
		outputLabel.text = "\(num.part0)," + " \(num.part1)"
	}
	
}

// MARK: - UITextFieldDelegate Conformance

extension MainViewController: UITextFieldDelegate {
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
		sendNumberForSplit()
		
		return true
	}
}
