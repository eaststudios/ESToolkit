//
//  UIComponentProtocol.swift
//
//  Created by Oliver Kulpakko on 2.2.2021.
//  Copyright © 2021 East Studios Oy. All rights reserved.
//

import UIKit

public protocol UIComponentProtocol: UIView {
	associatedtype ViewModel
	associatedtype Style

	var viewModel: ViewModel { get set }
	var style: Style { get set }

	/// Set up the subviews and the basic layout
	func commonInit()
	/// Update the contents, should be fired every time `viewModel` is changed.
	func render()
	/// Update the styles, should be fired every time `style` is changed.
	func applyStyle()
}

public extension UIComponentProtocol {
	public init(viewModel: ViewModel, style: Style) {
		self.init(frame: .zero)
		self.commonInit()

		self.viewModel = viewModel
		self.style = style

		self.render()
		self.applyStyle()
	}
}
