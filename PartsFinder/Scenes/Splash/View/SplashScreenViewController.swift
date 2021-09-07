//
//  SplashScreenViewController.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

/// Implements the splash screen UI
final class SplashScreenViewController: UIViewController {

	// MARK: - Properties

	/// App title that is shown in the center of the screen
	private lazy var appNameLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = UIFont.init(name: "NexaBold", size: 30)
		label.text = "Parts Finder".uppercased()
		label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		label.alpha = 0.7
		return label
	}()

	/// Little copyright statemen situated near the bottomt
	private lazy var authorLabel: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: UIScreen.main.bounds.height,
				y: UIScreen.main.bounds.height / 2,
				width: 300,
				height: 50
			)
		)
		label.font = label.font.withSize(13)
		label.text = "eyedropping, 2021"
		label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		label.alpha = 0.3
		return label
	}()

	/// Gradient background
	private var gradientLayer: CAGradientLayer?

	// MARK: - View Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		createBackdropGradient()
		addSubviews()
		constrainSubviews()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		perform(#selector(presentMainScene), with: nil, afterDelay: 2.0)
	}

	// MARK: - Methods

	/// Adds subviews to the hierarchy
	private func addSubviews() {
		[
			appNameLabel,
			authorLabel
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
		}
	}

	/// Adds-up constaints
	private func constrainSubviews() {
		NSLayoutConstraint.activate([
			appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			appNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			authorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			authorLabel.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
		])
	}

	/// Sets up the gradient backdrop
	private func createBackdropGradient() {
		gradientLayer = CAGradientLayer()

		guard let layer = gradientLayer else {
			return
		}

		layer.frame = view.bounds
		layer.colors = [
			#colorLiteral(red: 0.3173888028, green: 0.7608219981, blue: 0.4352326393, alpha: 1).cgColor,
			#colorLiteral(red: 0.9489449859, green: 0.9137673974, blue: 0.004057167098, alpha: 1).cgColor
		]
		layer.locations = [0, 1]
		self.view.layer.insertSublayer(layer, at: 0)
	}

	/// Tells the coordinator to present the main scene
	@objc
	private func presentMainScene() {
		Coordinator.shared.route(to: .main)
	}
}
