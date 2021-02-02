//
//  UIView.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public extension UIView {
	public var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			clipsToBounds = newValue > 0
			layer.cornerRadius = newValue
		}
	}

	public func layout(with constraints: [NSLayoutConstraint]) {
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(constraints)
	}

	public func embedSubview(_ subview: UIView, inset: CGFloat = 0) {
		addSubview(subview)
		subview.layout(with: [
			subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
			subview.topAnchor.constraint(equalTo: topAnchor, constant: inset),
			trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: inset),
			bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: inset)
		])
	}
}
