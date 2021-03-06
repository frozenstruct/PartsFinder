//
//  MainViewController.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 23.08.2021.
//

import UIKit

/// A type that supports UI-related actions of the main scene
protocol MainViewControllerInputProtocol: AnyObject {

	/// Interactor to handle the scene business logic
	var interactor: MainInteractorInputProtocol? { get set }

	/// Tells the view controller to display the split result on the screen
	/// - Parameter num: split result tuple to be displayed
	func displayResult(_ num: SplitResult)
}

class MainViewController: UIViewController, MainViewControllerInputProtocol {

	// MARK: - Subtypes

	/// Utility struct that holds the default dimensions for buttons
	enum DimensionalConstants {
		static var buttonHeight: CGFloat = 30.0
		static var buttonWidth: CGFloat = 75.0
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
			image: #imageLiteral(resourceName: "backdrop")
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

	// MARK: - Properties

	var interactor: MainInteractorInputProtocol?

	// MARK: - View Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		addSubviews()
		constrainSubviews()
		createBackdropGradient()

		view.backgroundColor = .white
	}

	// MARK: - UI Assembly

	/// Adds views to the hierarchy
	func addSubviews() {
		[
			titleLabel,
			backdropImageView,
			inputTitleLabel,
			inputTextField,
			processButton,
			outputLabel
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
		}
	}

	/// Addds up constraints
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
			processButton.heightAnchor.constraint(equalToConstant: DimensionalConstants.buttonHeight)
		])

		NSLayoutConstraint.activate([
			outputLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			outputLabel.topAnchor.constraint(equalTo: processButton.bottomAnchor, constant: 40)
		])
	}

	// MARK: - Methods

	/// Sends the number from user input to interactor for splitting
	@objc
	func split() {
		guard let text = inputTextField.text,
			  let number = Double(text)
		else {
			return
		}

		interactor?.split(number)
	}

	/// Displays the result (imp)
	func displayResult(_ numbers: SplitResult) {
		outputLabel.text = "\(numbers.part0)," + " \(numbers.part1)"
	}

	/// Sets up the gradient backdrop
	private func createBackdropGradient() {
		DSNGradient.color(
			.green
		).onView(view)
	}
}
