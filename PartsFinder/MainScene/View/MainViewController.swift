//
//  MainViewController.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

protocol MainViewControllerInputProtocol: AnyObject {

	var interactor: MainInteractorInputProtocol? { get set }

	func displayResult(_ num: SplitResult)
}

class MainViewController: UIViewController, MainViewControllerInputProtocol {

	// MARK: - VIP

	var interactor: MainInteractorInputProtocol?

	// MARK: - Utility

	struct DimensionalConstants {

		static var defaultButtonHeight: CGFloat = 30.0
		static var defaultButtonWidth: CGFloat = 75.0
	}

	// MARK: - UI Constituents

	/// Greeting Label
	private lazy var titleLabel: UILabel = {
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
	private lazy var inputTitleLabel: UILabel = {
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

	/// The main button, that perform the action
	private lazy var processButton: UIButton = {
		let button = UIButton(type: .roundedRect)
		button.setTitle("SPLIT", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.titleLabel?.sizeToFit()
		button.addTarget(
			self,
			action: #selector(split),
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
			titleLabel,
			backdropImageView,
			inputTitleLabel,
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
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleLabel.topAnchor.constraint(equalTo: view.safeTopAnchor)
		])

		NSLayoutConstraint.activate([
			backdropImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			backdropImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			inputTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			inputTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
		])

		NSLayoutConstraint.activate([
			inputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			inputTextField.topAnchor.constraint(equalTo: inputTitleLabel.bottomAnchor, constant: 20),
			inputTextField.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor, constant: 20),
			inputTextField.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -20)
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

	@objc
	func split() {
		guard let text = inputTextField.text,
			  let number = Double(text)
		else {
			return
		}

		interactor?.split(number)
	}

	func displayResult(_ numbers: SplitResult) {
		outputLabel.text = "\(numbers.part0)," + " \(numbers.part1)"
	}
}
