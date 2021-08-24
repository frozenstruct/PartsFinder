//
//  MainViewController.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

protocol MainViewControllerInputProtocol {

	var interactor: MainInteractorInputProtocol? { get set }
}

class MainViewController: UIViewController, MainViewControllerInputProtocol {
	
	var interactor: MainInteractorInputProtocol?

	// MARK: - Utility
	
	struct DimensionalConstants {
		
		static var defaultButtonHeight: CGFloat = 30.0
		static var defaultButtonWidth: CGFloat = 75.0
	}
	
	// MARK: - UI Constituents
	
	/// Greeting Label
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
		field.placeholder = "Enter the number here"
		return field
	}()
	
	/// The main button, that perform the action
	private lazy var processButton: UIButton = {
		let button = UIButton(type: .roundedRect)
		button.setTitle("SPLIT", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.titleLabel?.sizeToFit()
		return button
	}()
	
	/// Holds the textual title of the output text field
	private lazy var outputLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = "Result will be here..."
		label.sizeToFit()
		return label
	}()
	
	
	
	// MARK: - Initialization
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - View Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		addSubviews()
		constarinSubviews()
		
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
	
	func constarinSubviews() {
		
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
}
