//
//  UIViewController.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit
import SafariServices

// MARK: Present

public extension UIViewController {
	public func present(_ viewControllerToPresent: UIViewController) {
		self.present(viewControllerToPresent, animated: true, completion: nil)
	}

	public func presentError(_ error: Error) {
		let alert = UIAlertController(error: error)
		alert.addAction(.ok)
		present(alert)
	}

	public func presentAlert(_ title: String) {
		let alert = UIAlertController(title: title)
		alert.addAction(.ok)
		present(alert)
	}

	public func presentURL(_ url: URL) {
		let safariViewController = SFSafariViewController(url: url)
		present(safariViewController)
	}
}

// MARK: Dismiss

public extension UIViewController {
	public func addDismissButton(_ side: DismissButtonSide = .right) {
		let button = UIBarButtonItem(
			barButtonSystemItem: side == DismissButtonSide.right ? .done : .cancel,
			target: self,
			action: #selector(done))


		switch side {
		case .right:
			navigationItem.rightBarButtonItem = button
		case .left:
			navigationItem.leftBarButtonItem = button
		}
	}

	@IBAction public func done() {
		self.dismiss(animated: true, completion: nil)
	}

	public enum DismissButtonSide {
		case left
		case right
	}
}
