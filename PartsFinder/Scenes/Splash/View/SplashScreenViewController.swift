//
//  SplashScreenViewController.swift
//  PartsFinder
//
//  Created by Dmitry Aksyonov on 05.09.2021.
//

import UIKit

final class SplashScreenViewController: UIViewController {

	// MARK: - Properties

	weak var coordinator: MainCoordinator?

	private lazy var appNameLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.font = UIFont.init(name: "NexaBold", size: 30)
		label.text = "Parts Finder".uppercased()
		label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		label.alpha = 0.7
		return label
	}()

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
		presentMainScene()
	}

	// MARK: - Methods

	private func addSubviews() {
		[
			appNameLabel,
			authorLabel
		].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
		}
	}

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

	private func presentMainScene() {
		let viewController = MainSceneAssembler(
			MainSceneDependencyContainer(
				numberSplitter: NumberSplitter()
			)
		).make()

		viewController.modalTransitionStyle = .crossDissolve
		viewController.modalPresentationStyle = .fullScreen

		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.present(viewController, animated: true, completion: nil)
		}
	}
}
