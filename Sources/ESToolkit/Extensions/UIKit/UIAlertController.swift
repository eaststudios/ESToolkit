//
//  UIAlertController.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension UIAlertController {
	public convenience init(error: Error, preferredStyle: UIAlertController.Style = .alert) {
		self.init(title: error.localizedDescription, message: nil, preferredStyle: preferredStyle)
	}

	public convenience init(title: String?, action: UIAlertAction? = nil) {
		self.init(title: title, message: nil, preferredStyle: .alert)

		if let action = action {
			addAction(action)
		}
	}
}
